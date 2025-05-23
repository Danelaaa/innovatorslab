const express = require('express');
const router = express.Router();
const db = require('../db/db');
const { verifyToken } = require('../middleware/authMiddleware'); // Import middleware


router.get('/take-quiz/:quizId',verifyToken, (req, res) => {
    const token = req.cookies.jwt; // ✅ Get JWT token

    if (!token) {
        return res.status(401).json({ error: 'Unauthorized: No token provided' });
    }

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        const userId = decoded.id; // ✅ Extract user ID

        if (!userId) {
            return res.status(400).send("User ID is missing");
        }

        // Fetch quiz data
        const sql = `
            SELECT q.id AS quiz_id, q.title, qt.id AS question_id, qt.question_text, 
                   a.id AS answer_id, a.answer_text 
            FROM quizzes q
            JOIN questions qt ON q.id = qt.quiz_id
            JOIN answers a ON qt.id = a.question_id
            WHERE q.id = ?;
        `;

        db.query(sql, [req.params.quizId], (err, results) => {
            if (err) return res.status(500).send({ error: err.code, message: err.sqlMessage });

            if (results.length === 0) {
                return res.status(404).send("Quiz not found");
            }

            const quiz = { id: req.params.quizId, title: results[0]?.title, questions: [] };

            results.forEach(row => {
                let question = quiz.questions.find(q => q.id === row.question_id);
                if (!question) {
                    question = { id: row.question_id, question_text: row.question_text, answers: [] };
                    quiz.questions.push(question);
                }
                question.answers.push({ id: row.answer_id, answer_text: row.answer_text });
            });

            res.render("quiz", { quiz, userId }); // ✅ Pass userId properly
        });

    } catch (err) {
        return res.status(401).json({ error: 'Unauthorized: Invalid token' });
    }
});

module.exports = router;
