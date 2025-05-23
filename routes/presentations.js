var express = require("express");
var multer = require("multer");
var path = require("path");
var db = require("../db/db");
var fs = require("fs");

var router = express.Router();

// Multer storage setup
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        const uploadDir = path.join(__dirname, "..", "public", "uploads", "presentations");
        if (!fs.existsSync(uploadDir)) {
            fs.mkdirSync(uploadDir, { recursive: true });
        }
        cb(null, uploadDir);
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + path.extname(file.originalname));
    },
});
var upload = multer({ storage });

// 🟢 GET all presentations with language names
router.get("/", function (req, res) {
    const presentationQuery = `
        SELECT p.id, p.title, p.file_path, l.name AS language
        FROM presentations p
        LEFT JOIN presentation_languages pl ON p.id = pl.presentation_id
        LEFT JOIN languages l ON pl.language_id = l.id
    `;
    const languageQuery = `SELECT * FROM languages`;

    db.query(presentationQuery, function (err, presentations) {
        if (err) return res.status(500).send("Presentation fetch error");

        db.query(languageQuery, function (err2, languages) {
            if (err2) return res.status(500).send("Languages fetch error");

            res.render("admin/presentations", {
                presentations,
                languages,
            });
        });
    });
});

// 🟢 Upload
router.post("/upload", upload.single("file"), function (req, res) {
    const { title, language_id } = req.body;
    const filePath = "/uploads/presentations/" + req.file.filename;

    if (!title || !req.file || !language_id) {
        return res.status(400).send("All fields required.");
    }

    db.query("INSERT INTO presentations (title, file_path) VALUES (?, ?)", [title, filePath], function (err, result) {
        if (err) return res.status(500).send("Insert error");

        const presentationId = result.insertId;
        db.query(
            "INSERT INTO presentation_languages (presentation_id, language_id) VALUES (?, ?)",
            [presentationId, language_id],
            function (err2) {
                if (err2) return res.status(500).send("Language insert error");
                res.redirect("/admin/presentations");
            }
        );
    });
});

// 🟢 Edit
router.post("/edit", function (req, res) {
    const { id, title, language_id } = req.body;

    if (!id || !title || !language_id) return res.status(400).send("Missing data.");

    db.beginTransaction((err) => {
        if (err) return res.status(500).send("Transaction error");

        db.query("UPDATE presentations SET title = ? WHERE id = ?", [title, id], function (err1) {
            if (err1) return db.rollback(() => res.status(500).send("Update error"));

            const query = `
                INSERT INTO presentation_languages (presentation_id, language_id)
                VALUES (?, ?)
                ON DUPLICATE KEY UPDATE language_id = VALUES(language_id)
            `;
            db.query(query, [id, language_id], function (err2) {
                if (err2) return db.rollback(() => res.status(500).send("Lang update error"));

                db.commit((errCommit) => {
                    if (errCommit) return db.rollback(() => res.status(500).send("Commit error"));
                    res.redirect("/admin/presentations");
                });
            });
        });
    });
});

// 🟢 Delete
router.post("/delete/:id", function (req, res) {
    const id = req.params.id;

    db.query("SELECT file_path FROM presentations WHERE id = ?", [id], function (err, results) {
        if (err || results.length === 0) return res.status(404).send("Not found");

        const fullPath = path.join(__dirname, "..", "public", results[0].file_path);

        fs.unlink(fullPath, function (err) {
            if (err && err.code !== "ENOENT") return res.status(500).send("File delete error");

            db.beginTransaction(function (errTx) {
                if (errTx) return res.status(500).send("TX error");

                db.query("DELETE FROM presentation_languages WHERE presentation_id = ?", [id], function (err1) {
                    if (err1) return db.rollback(() => res.status(500).send("Lang delete error"));

                    db.query("DELETE FROM presentations WHERE id = ?", [id], function (err2) {
                        if (err2) return db.rollback(() => res.status(500).send("Pres delete error"));

                        db.commit(function (errCommit) {
                            if (errCommit) return db.rollback(() => res.status(500).send("Commit error"));
                            res.redirect("/admin/presentations");
                        });
                    });
                });
            });
        });
    });
});

module.exports = router;
