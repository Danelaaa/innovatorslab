const express = require('express');
const router = express.Router();
const db = require('../db/db');
const { verifyToken } = require('../middleware/authMiddleware'); // Import middleware

// ✅ Quiz submission route
router.post('/submit', verifyToken, (req, res) => {
    const { quiz_id, answers } = req.body;
    const user_id = req.user.id;

    if (!user_id || !quiz_id || !answers || answers.length === 0) {
        console.error("❌ Missing required fields in quiz submission:", req.body);
        return res.status(400).json({ error: "Missing required fields." });
    }

    // ✅ Get the correct course_id and step_number for this quiz
    const getCourseStepQuery = `
        SELECT course_id, step_number 
        FROM course_steps 
        WHERE quiz_id = ? 
        LIMIT 1
    `;

    db.query(getCourseStepQuery, [quiz_id], (err, result) => {
        if (err || result.length === 0) {
            console.error("❌ Error fetching step number:", err || "No matching step found.");
            return res.status(500).json({ error: "Step not found." });
        }

        const { course_id, step_number } = result[0]; // ✅ Correct step number
        console.log(`✅ Retrieved Course ID: ${course_id}, Step Number: ${step_number} for Quiz ID: ${quiz_id}`);

        // ✅ Fetch correct answers
        const fetchCorrectAnswersQuery = `
            SELECT q.id AS question_id, a.id AS correct_answer_id
            FROM questions q
            JOIN answers a ON q.id = a.question_id
            WHERE a.is_correct = 1 AND q.quiz_id = ?
        `;

        db.query(fetchCorrectAnswersQuery, [quiz_id], (err, correctAnswers) => {
            if (err) {
                console.error("❌ Error fetching correct answers:", err);
                return res.status(500).json({ error: err.code, message: err.sqlMessage });
            }

            let correctCount = 0;
            let totalQuestions = correctAnswers.length;
            const correctAnswerMap = new Map(correctAnswers.map(ans => [ans.question_id, ans.correct_answer_id]));

            const answerValues = answers.map(answer => {
                const isCorrect = correctAnswerMap.get(parseInt(answer.question_id)) === parseInt(answer.selected_answer_id);
                if (isCorrect) correctCount++;
                return [user_id, quiz_id, answer.question_id, answer.selected_answer_id, isCorrect ? 1 : 0];
            });

            const score = ((correctCount / totalQuestions) * 100).toFixed(2);

            // ✅ Insert User Answers
            const insertAnswersQuery = `
                INSERT INTO user_answers (user_id, quiz_id, question_id, selected_answer_id, is_correct)
                VALUES ?
            `;

            db.query(insertAnswersQuery, [answerValues], (err) => {
                if (err) {
                    console.error("❌ Error inserting user answers:", err);
                    return res.status(500).json({ error: err.code, message: err.sqlMessage });
                }

                // ✅ Check if the step is already completed
                const checkProgressQuery = `
                    SELECT 1 FROM user_progress 
                    WHERE user_id = ? AND course_id = ? AND step_number = ? AND is_completed = TRUE
                    LIMIT 1
                `;

                db.query(checkProgressQuery, [user_id, course_id, step_number], (err, progressResult) => {
                    if (err) {
                        console.error("❌ Error checking user progress:", err);
                        return res.status(500).json({ error: err.code, message: err.sqlMessage });
                    }

                    const isStepCompleted = progressResult.length > 0; // ✅ Step is already completed

                    if (!isStepCompleted) {
                        // ✅ Insert/Update User Score only if step is NOT completed
                        const insertScoreQuery = `
                            INSERT INTO user_scores (user_id, quiz_id, score)
                            VALUES (?, ?, ?)
                            ON DUPLICATE KEY UPDATE score = VALUES(score)
                        `;

                        db.query(insertScoreQuery, [user_id, quiz_id, score], (err) => {
                            if (err) {
                                console.error("❌ Error saving user score:", err);
                                return res.status(500).json({ error: err.code, message: err.sqlMessage });
                            }
                        });
                    } else {
                        console.log(`✅ Step ${step_number} already completed. Skipping score update.`);
                    }

                    // ✅ If step is already completed, return success response
                    if (isStepCompleted) {
                        return res.json({
                            success: true,
                            message: `Quiz submitted successfully! Step ${step_number} was already marked as completed.`,
                            score
                        });
                    }

                    // ✅ Ensure the correct step is marked as completed **ONLY** if score >= 80
                    if (score >= 70) {
                        const updateProgressQuery = `
                            INSERT INTO user_progress (user_id, course_id, step_number, is_completed)
                            VALUES (?, ?, ?, TRUE)
                            ON DUPLICATE KEY UPDATE is_completed = TRUE;
                        `;

                        db.query(updateProgressQuery, [user_id, course_id, step_number], (err) => {
                            if (err) {
                                console.error("❌ Error updating user progress:", err);
                                return res.status(500).json({ error: err.code, message: err.sqlMessage });
                            }

                            console.log(`✅ Step ${step_number} correctly marked as completed for User ${user_id}`);
                            return res.json({
                                success: true,
                                message: `Quiz submitted successfully! Step ${step_number} marked as completed.`,
                                score
                            });
                        });
                    } else {
                        return res.json({
                            success: true,
                            message: `Quiz submitted successfully, but step ${step_number} was NOT marked as completed due to low score.`,
                            score
                        });
                    }
                });
            });
        });
    });
});
router.delete('/:id', async (req, res) => {
    const quizId = req.params.id;

    try {
        const connection = db.promise();
        await connection.execute('DELETE FROM quizzes WHERE id = ?', [quizId]);
        res.json({ message: '✅ Quiz deleted successfully' });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: '❌ Database error' });
    }
});
router.get('/:id', verifyToken, async (req, res) => {
    const quizId = req.params.id;
    const userId = req.user.id; // ✅ Now `req.user` will have `id`
    const courseId = req.query.courseId || null;

    try {
        const connection = db.promise();
        const [quiz] = await connection.execute('SELECT * FROM quizzes WHERE id = ?', [quizId]);

        if (quiz.length === 0) {
            return res.status(404).render("error", { message: "Quiz not found" });
        }

        const [questions] = await connection.execute('SELECT * FROM questions WHERE quiz_id = ?', [quizId]);

        for (let question of questions) {
            const [answers] = await connection.execute('SELECT id, answer_text FROM answers WHERE question_id = ?', [question.id]);
            question.answers = answers;
        }


        res.render('quiz', { 
            quiz: quiz[0], 
            questions, 
            userId, // ✅ Now userId is correctly passed
            courseId 
        });

    } catch (err) {
        console.error(err);
        res.status(500).render("error", { message: "❌ Database error" });
    }
});
router.get('/', (req, res) => {
    const token = req.cookies.token; // Get JWT token from cookies

    if (!token) {
        return res.redirect('/login'); // Redirect if not logged in
    }

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        res.render('quiz', { userId: decoded.id }); // Pass user ID to template
    } catch (err) {
        return res.redirect('/login');
    }
});
module.exports = router;
