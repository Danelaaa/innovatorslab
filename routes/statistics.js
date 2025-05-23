var express = require('express');
var router = express.Router();
var db = require('../db/db'); // Ensure this points to your database connection

router.get('/api/statistics', async function (req, res) {
    try {
        var statsQuery = `
            SELECT 
                (SELECT COUNT(*) FROM users) AS total_users,
                (SELECT COUNT(*) FROM certificates) AS total_certifications,
                (SELECT COUNT(*) FROM quizzes) AS total_quizzes,
                (SELECT COUNT(DISTINCT CONCAT(user_id, '-', quiz_id)) FROM user_scores WHERE score >= 80) AS quiz_passed,
                (SELECT COUNT(DISTINCT CONCAT(user_id, '-', quiz_id)) FROM user_scores WHERE score < 80) AS quiz_failed,
                (SELECT COUNT(*) FROM users WHERE MONTH(created_at) = MONTH(CURRENT_DATE()) AND YEAR(created_at) = YEAR(CURRENT_DATE())) AS new_users_this_month,
                (SELECT COUNT(*) FROM course_steps) AS total_courses,
                (SELECT IFNULL(ROUND(AVG(score), 2), 0) FROM user_scores WHERE score >= 80) AS top_scorer_avg_score,
                (SELECT q.title 
                 FROM quizzes q
                 JOIN (SELECT quiz_id, COUNT(*) AS attempts 
                       FROM user_scores 
                       GROUP BY quiz_id 
                       ORDER BY attempts DESC 
                       LIMIT 1) AS most_popular
                 ON q.id = most_popular.quiz_id) AS most_popular_quiz
            FROM DUAL;
        `;
        
        var growthQuery = `
            SELECT 
                DATE_FORMAT(created_at, '%Y-%m') AS month, -- Formats as "YYYY-MM" for sorting
                COUNT(*) AS user_count
            FROM users
            WHERE created_at >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
            GROUP BY month
            ORDER BY month;
        `;

        var quizPerformanceQuery = `
            SELECT 
                DATE_FORMAT(created_at, '%Y-%m') AS month,
                SUM(CASE WHEN score >= 80 THEN 1 ELSE 0 END) AS passed_quizzes,
                SUM(CASE WHEN score < 80 THEN 1 ELSE 0 END) AS failed_quizzes
            FROM user_scores
            WHERE created_at >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
            GROUP BY month
            ORDER BY month;
        `;

        var topQuizzesQuery = `
            SELECT q.title AS quiz_title, COUNT(us.quiz_id) AS attempts
            FROM user_scores us
            JOIN quizzes q ON us.quiz_id = q.id
            GROUP BY us.quiz_id, q.title
            ORDER BY attempts DESC
            LIMIT 5;
        `;

        // Execute all queries in parallel
        const [statsResult, growthResult, quizPerformanceResult, topQuizzesResult] = await Promise.all([
            db.promise().query(statsQuery),
            db.promise().query(growthQuery),
            db.promise().query(quizPerformanceQuery),
            db.promise().query(topQuizzesQuery)
        ]);

        const stats = statsResult[0][0];
        const growth = growthResult[0];
        const quizPerformance = quizPerformanceResult[0];
        const topQuizzes = topQuizzesResult[0];

        res.json({
            ...stats,
            user_growth: {
                months: growth.map(row => row.month),
                counts: growth.map(row => row.user_count)
            },
            quiz_performance: {
                months: quizPerformance.map(row => row.month),
                passed: quizPerformance.map(row => row.passed_quizzes),
                failed: quizPerformance.map(row => row.failed_quizzes)
            },
            top_quizzes: topQuizzes.map(row => ({
                quiz_name: row.quiz_title,
                attempts: row.attempts
            }))
        });

    } catch (error) {
        console.error('Error fetching statistics:', error);
        res.status(500).json({ error: "Internal Server Error" });
    }
});

module.exports = router;
