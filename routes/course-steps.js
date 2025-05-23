const express = require('express');
const router = express.Router();
const db = require('../db/db');
const { verifyToken } = require('../middleware/authMiddleware');


router.delete('/course-steps/:id', async (req, res) => {
    try {
        const { id } = req.params;
        const connection = db.promise();
        await connection.execute('DELETE FROM course_steps WHERE id = ?', [id]);

        res.json({ message: '✅ Course step deleted successfully' });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: '❌ Database error' });
    }
});

router.put('/course-steps/:id', async (req, res) => {
    try {
        const { id } = req.params;
        const { step_number, presentation_id, quiz_id } = req.body;

        const connection = db.promise();
        await connection.execute(
            'UPDATE course_steps SET step_number = ?, presentation_id = ?, quiz_id = ? WHERE id = ?',
            [step_number, presentation_id, quiz_id, id]
        );

        res.json({ message: '✅ Course step updated successfully' });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: '❌ Database error' });
    }
});


router.post('/course-steps', async (req, res) => {
    const { course_id, step_number, presentation_id, quiz_id } = req.body;
    try {
        await db.execute(
            'INSERT INTO course_steps (course_id, step_number, presentation_id, quiz_id) VALUES (?, ?, ?, ?)',
            [course_id, step_number, presentation_id, quiz_id]
        );
        res.json({ message: 'Course step added successfully' });
    } catch (error) {
        res.status(500).json({ message: 'Error adding course step', error });
    }
});
module.exports = router;