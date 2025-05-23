const express = require('express');
const router = express.Router();
const db = require('../db/db');

// Handle quiz submission
router.post('/submit-quiz', (req, res) => {
    const { userId, courseId, stepNumber, score } = req.body;

    if (score < 70) {
        return res.status(400).json({ message: "❌ Quiz failed. Try again!" });
    }

    const sql = `INSERT INTO user_progress (user_id, course_id, step_number, is_completed)
                 VALUES (?, ?, ?, TRUE)
                 ON DUPLICATE KEY UPDATE is_completed = TRUE`;

    db.query(sql, [userId, courseId, stepNumber], (err) => {
        if (err) return res.status(500).send(err);
        res.json({ message: "✅ Step completed! Next step unlocked." });
    });
});

module.exports = router;
