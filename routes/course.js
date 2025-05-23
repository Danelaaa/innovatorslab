const express = require('express');
const router = express.Router();
const db = require('../db/db');
const { verifyToken } = require('../middleware/authMiddleware');

// ✅ Route to get course steps and user progress
router.get('/:courseId/:userId', async (req, res) => {
    try {
        const { courseId, userId } = req.params;

        if (!userId || !courseId) {
            console.error("❌ Missing userId or courseId in request parameters.");
            return res.status(400).json({ error: "Missing userId or courseId." });
        }

        // ✅ Fetch Course Steps (Always Unlocked)
        const [stepsResults] = await db.promise().query(`
            SELECT cs.step_number, cs.presentation_id, cs.quiz_id, p.file_path AS presentation
            FROM course_steps cs
            LEFT JOIN presentations p ON cs.presentation_id = p.id
            WHERE cs.course_id = ?
            ORDER BY cs.step_number;
        `, [courseId]);

        if (stepsResults.length === 0) {
            console.warn("⚠ No steps found for this course.");
            return res.status(404).json({ error: "No course steps found." });
        }

        // ✅ Get User Progress
        const [completedSteps] = await db.promise().query(`
            SELECT step_number, is_completed FROM user_progress 
            WHERE user_id = ? AND course_id = ?;
        `, [userId, courseId]);

        const completedStepMap = new Map();
        completedSteps.forEach(({ step_number, is_completed }) => {
            completedStepMap.set(step_number, is_completed);
        });

        // ✅ Format Steps (Always Unlocked)
        const stepsFormatted = stepsResults.map((step) => ({
            step_number: step.step_number,
            presentation: step.presentation,
            quiz_id: step.quiz_id,
            status: completedStepMap.get(step.step_number) === 1 ? "completed" : "not completed"
        }));

        // ✅ Fetch Course Details
        const [courseData] = await db.promise().query("SELECT * FROM courses WHERE id = ?", [courseId]);

        if (courseData.length === 0) {
            console.warn("⚠ Course not found.");
            return res.status(404).json({ error: "Course not found." });
        }

        // ✅ Render Course Page
        res.render('mycourse', { 
            course: courseData[0], 
            steps: stepsFormatted, 
            userId
        });

    } catch (error) {
        console.error("❌ Server Error:", error);
        res.status(500).json({ error: error.message });
    }
});
router.get('/:courseId/steps/:userId',verifyToken, async (req, res) => {
    const { courseId, userId } = req.params;

    const sql = `
        SELECT cs.step_number, cs.presentation_id, cs.quiz_id, 
               IFNULL(up.is_completed, FALSE) AS is_completed
        FROM course_steps cs
        LEFT JOIN user_progress up 
        ON cs.course_id = up.course_id 
        AND cs.step_number = up.step_number 
        AND up.user_id = ?
        WHERE cs.course_id = ?
        ORDER BY cs.step_number;
    `;

    db.query(sql, [userId, courseId], (err, results) => {
        if (err) return res.status(500).send(err);
        res.render('course-progress', { steps: results, courseId, userId });
    });
});


module.exports = router;
