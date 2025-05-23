const express = require("express");
const fs = require("fs");
const path = require("path");
const PDFDocument = require("pdfkit");
const db = require("../db/db");
const { verifyToken } = require('../middleware/authMiddleware');

const router = express.Router();

// Generate certificate PDF
router.get("/generate/:userId/:courseId", verifyToken, (req, res) => {
    const { userId, courseId } = req.params;

    if (!userId || !courseId) {
        console.error("❌ Missing userId or courseId");
        return res.status(400).json({ error: "User ID and Course ID are required." });
    }

    console.log(`✅ Processing Certificate for User: ${userId}, Course: ${courseId}`);

    // Step 1: Get total steps for the course
    db.query(`SELECT COUNT(DISTINCT step_number) AS totalSteps FROM course_steps WHERE course_id = ?`, [courseId], (err, result) => {
        if (err) {
            console.error("❌ Error fetching total steps:", err);
            return res.status(500).json({ error: "Database error" });
        }

        const totalSteps = result[0]?.totalSteps || 0;

        // Step 2: Get user's completed steps
        db.query(`
            SELECT COUNT(DISTINCT step_number) AS completedSteps 
            FROM user_progress 
            WHERE user_id = ? AND course_id = ? AND is_completed = TRUE
        `, [userId, courseId], (err, progressResult) => {
            if (err) {
                console.error("❌ Error fetching user progress:", err);
                return res.status(500).json({ error: "Database error" });
            }

            const completedSteps = progressResult[0]?.completedSteps || 0;

            if (completedSteps < totalSteps) {
                return res.status(400).json({ message: "❌ You must complete all steps to get the certificate!" });
            }

            // Step 3: Get user's full name
            db.query(`SELECT name, surname FROM users WHERE id = ?`, [userId], (err, userResult) => {
                if (err || userResult.length === 0) {
                    console.error("❌ Error fetching user:", err);
                    return res.status(500).json({ error: "User not found" });
                }

                const { name, surname } = userResult[0];
                const fullName = `${name} ${surname}`;
                const filePath = path.join("public", "certificates", `certificate_${userId}_${courseId}.pdf`);

                // Step 4: Check if certificate already exists
                db.query(`SELECT * FROM certificates WHERE user_id = ? AND course_id = ?`, [userId, courseId], (err, certResult) => {
                    if (err) {
                        console.error("❌ Error checking existing certificate:", err);
                        return res.status(500).json({ error: "Database error" });
                    }

                    if (certResult.length > 0) {
                        return res.json({
                            message: "✅ Certificate already exists!",
                            file: `/certificates/certificate_${userId}_${courseId}.pdf`
                        });
                    }

                    // Step 5: Insert certificate record into DB
                    db.query(`INSERT INTO certificates (user_id, course_id) VALUES (?, ?)`, [userId, courseId], (err) => {
                        if (err) {
                            console.error("❌ Error inserting certificate record:", err);
                            return res.status(500).json({ error: "Database error" });
                        }

                        // Step 6: Generate PDF certificate
                        const doc = new PDFDocument({ size: 'A4', layout: 'landscape' });
                        const output = fs.createWriteStream(filePath);
                        doc.pipe(output);

                        // Add background image
                        const backgroundPath = path.join(__dirname, "../public/images/certificate_template.jpg");
                        doc.image(backgroundPath, 0, 0, { width: 842, height: 595 });

                        // Add user's name in the center
                        doc.font("Helvetica-Bold")
                            .fontSize(30)
                            .fillColor("#000")
                            .text(fullName, 0, 280, {
                                align: "center"
                            });

                        // Optional: Add date or other info
                        // doc.fontSize(16).text(`Date: ${new Date().toLocaleDateString()}`, 40, 530);

                        doc.end();

                        // Respond with success
                        res.json({
                            message: "✅ Certificate generated!",
                            file: `/certificates/certificate_${userId}_${courseId}.pdf`
                        });
                    });
                });
            });
        });
    });
});




// Fetch user's progress
router.get("/", verifyToken, (req, res) => {
    const userId = req.user.id; // Get userId from token
    console.log(`🔹 User ID: ${userId}`);
    const courseId = 1; // Assuming the courseId is fixed for now

    const courseSql = `SELECT name FROM courses WHERE id = ?`;
    const completedStepsSql = `
        SELECT COUNT(DISTINCT step_number) AS completedSteps 
        FROM user_progress 
        WHERE user_id = ? AND course_id = ? AND is_completed = TRUE
    `;
    const totalStepsSql = `SELECT COUNT(DISTINCT step_number) AS totalSteps FROM course_steps WHERE course_id = ?`;
    const certificateSql = `SELECT * FROM certificates WHERE user_id = ? AND course_id = ?`;

    db.query(courseSql, [courseId], (err, courseResult) => {
        if (err) {
            console.error("❌ Database error fetching course:", err);
            return res.status(500).send("Database error fetching course");
        }

        console.log("🔍 Course Query Result:", courseResult);

        const courseTitle = courseResult.length > 0 ? courseResult[0].name : "Unknown Course";

        db.query(completedStepsSql, [userId, courseId], (err, progressResult) => {
            if (err) {
                console.error("❌ Database error fetching progress:", err);
                return res.status(500).send("Database error fetching progress");
            }

            const completedSteps = progressResult[0]?.completedSteps || 0;

            db.query(totalStepsSql, [courseId], (err, totalResult) => {
                if (err) {
                    console.error("❌ Database error fetching steps:", err);
                    return res.status(500).send("Database error fetching steps");
                }

                const totalSteps = totalResult[0]?.totalSteps || 5; // Default 5

                db.query(certificateSql, [userId, courseId], (err, certResult) => {
                    if (err) {
                        console.error("❌ Database error fetching certificate:", err);
                        return res.status(500).send("Database error fetching certificate");
                    }

                    console.log("✅ Rendering Certificate Page with Data:", {
                        name: req.user.name, 
                        coursename: courseTitle, 
                        completedSteps, 
                        totalSteps,
                        userId,
                        certificate: certResult.length > 0 ? `/certificates/certificate_${userId}_${courseId}.pdf` : null
                    });

                    res.render("certificate", {
                        name: req.user.name,
                        coursename: courseTitle,
                        completedSteps,
                        totalSteps,
                        userId,
                        certificate: certResult.length > 0 ? `/certificates/certificate_${userId}_${courseId}.pdf` : null
                    });
                });
            });
        });
    });
});

module.exports = router;
