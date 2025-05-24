const express = require("express");
const router = express.Router();
const db = require("../db/db");
const { verifyToken } = require("../middleware/authMiddleware");

router.get("/", verifyToken, async (req, res) => {
  const userId = req.user?.id;
  const courseId = 1; // static course id

  try {
    const connection = db.promise();

    // 1. Fetch course info
    const [courseResult] = await connection.execute(
      `SELECT name, description FROM courses WHERE id = ?`,
      [courseId]
    );
    const course = courseResult[0];

    // 2. Fetch steps with progress and presentation/quiz info (one row per step)
    const [steps] = await connection.execute(
      `
            SELECT cs.step_number,
                   MIN(cs.presentation_id) AS presentation_id,
                   MIN(cs.quiz_id) AS quiz_id,
                   MIN(p.title) AS presentation_title, 
                   MIN(p.file_path) AS presentation_file,
                   MIN(q.title) AS quiz_title,
                   CASE 
                       WHEN up.step_number IS NOT NULL THEN 'completed'
                       ELSE 'not complete'
                   END AS status
            FROM course_steps cs
            LEFT JOIN presentations p ON cs.presentation_id = p.id
            LEFT JOIN quizzes q ON cs.quiz_id = q.id
            LEFT JOIN user_progress up 
                ON up.user_id = ? AND up.course_id = cs.course_id AND up.step_number = cs.step_number
            WHERE cs.course_id = ?
            GROUP BY cs.step_number, up.step_number
            ORDER BY cs.step_number ASC
        `,
      [userId, courseId]
    );

    // 3. Count completed steps
    const completedSteps = steps.filter(
      (step) => step.status === "completed"
    ).length;
    const totalSteps = steps.length;

    // 4. Fetch certificate
    const [certResult] = await connection.execute(
      `SELECT * FROM certificates WHERE user_id = ? AND course_id = ?`,
      [userId, courseId]
    );
    const certificate =
      certResult.length > 0
        ? `/certificates/certificate_${userId}_${courseId}.pdf`
        : null;

    // 5. Fetch presentations in multiple languages
    const [presentationsByLang] = await connection.execute(
      `
            SELECT 
                cs.step_number, 
                l.name AS language, 
                p.file_path
            FROM course_steps cs
            JOIN presentations p ON cs.presentation_id = p.id
            JOIN presentation_languages pl ON pl.presentation_id = p.id
            JOIN languages l ON pl.language_id = l.id
            WHERE cs.course_id = ?
        `,
      [courseId]
    );

    // 6. Organize into map: step_number -> { language: file_path }
    const presentationFiles = {};
    presentationsByLang.forEach(({ step_number, language, file_path }) => {
      if (!presentationFiles[step_number]) {
        presentationFiles[step_number] = {};
      }
      presentationFiles[step_number][language] = file_path;
    });

    // 7. Render with all data
    res.render("mycourse", {
      course,
      steps,
      completedSteps,
      totalSteps,
      userId,
      certificate,
      presentationFiles: JSON.stringify(presentationFiles), // send as JSON string
    });
  } catch (err) {
    console.error("❌ Error fetching course and steps:", err);
    res.status(500).json({ error: "Database error." });
  }
});

module.exports = router;
