// File: routes/news.js
const express = require('express');
const router = express.Router();
const db = require('../db/db');
const multer = require('multer');
const path = require('path');

// Multer setup
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/uploads/news');
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + path.extname(file.originalname));
    }
});
const upload = multer({ storage: storage });

// Show all news with optional category filter
// Show only news with category 'news'
router.get('/', (req, res) => {
    const categoryId = req.query.category;

    let query = `
        SELECT news.*, news_categories.name AS category_name
        FROM news
        LEFT JOIN news_categories ON news.category_id = news_categories.id
        WHERE news_categories.name = 'news'
    `;
    const params = [];

    if (categoryId) {
        query += ' AND category_id = ?';
        params.push(categoryId);
    }

    query += ' ORDER BY news.created_at DESC';

    db.query(query, params, (err, results) => {
        if (err) throw err;

        results.forEach(news => {
            news.shortContent = news.content.substring(0, 100).replace(/\r?\n/g, '<br>') + '...';
        });

        // Only fetch 'news' category
        db.query("SELECT * FROM news_categories WHERE name = 'news'", (err, categories) => {
            if (err) throw err;

            res.render('news', {
                news: results,
                categories,
                selectedCategory: categoryId
            });
        });
    });
});



// Admin Panel: Add/Edit/List News
router.get('/admin', (req, res) => {
    const editId = req.query.editId;

    const query = `
        SELECT news.*, news_categories.name AS category_name
        FROM news
        LEFT JOIN news_categories ON news.category_id = news_categories.id
        ORDER BY news.created_at DESC
    `;

    db.query(query, (err, newsResults) => {
        if (err) throw err;

        db.query('SELECT * FROM news_categories', (err, categories) => {
            if (err) throw err;

            if (editId) {
                const newsToEdit = newsResults.find(news => news.id == editId);
                if (!newsToEdit) return res.status(404).send('News not found');

                return res.render('admin_add_news', {
                    newsList: newsResults,
                    editNews: newsToEdit,
                    categories
                });
            }

            res.render('admin_add_news', {
                newsList: newsResults,
                categories
            });
        });
    });
});


// Handle Add News
router.post('/admin/add', upload.single('image'), (req, res) => {
    const { title, content, category_id } = req.body;
    const image = req.file ? '/uploads/news/' + req.file.filename : null;

    if (!title || !content || !category_id) {
        return res.status(400).send('Title, content, and category required');
    }

    db.query(
        'INSERT INTO news (title, content, image, category_id, created_at) VALUES (?, ?, ?, ?, NOW())',
        [title, content, image, category_id],
        (err) => {
            if (err) throw err;
            res.redirect('/news/admin');
        }
    );
});

// Handle Edit News
router.post('/admin/edit/:id', upload.single('image'), (req, res) => {
    const newsId = req.params.id;
    const { title, content, category_id } = req.body;
    const image = req.file ? '/uploads/news/' + req.file.filename : null;

    if (!title || !content || !category_id) {
        return res.status(400).send('Title, content, and category required');
    }

    let query = 'UPDATE news SET title = ?, content = ?, category_id = ?';
    let params = [title, content, category_id];

    if (image) {
        query += ', image = ?';
        params.push(image);
    }

    query += ' WHERE id = ?';
    params.push(newsId);

    db.query(query, params, (err) => {
        if (err) throw err;
        res.redirect('/news/admin');
    });
});

// Handle Delete News
router.post('/admin/delete/:id', (req, res) => {
    const newsId = req.params.id;
    db.query('DELETE FROM news WHERE id = ?', [newsId], (err) => {
        if (err) throw err;
        res.redirect('/news/admin');
    });
});

// Show single news
router.get('/:id', (req, res) => {
    const newsId = req.params.id;
    db.query('SELECT * FROM news WHERE id = ?', [newsId], (err, results) => {
        if (err) throw err;
        if (results.length === 0) return res.status(404).send('News not found');

        const news = results[0];

        const createdAt = new Date(news.created_at);
        const formattedDate = createdAt.getFullYear() + '-' +
            String(createdAt.getMonth() + 1).padStart(2, '0') + '-' +
            String(createdAt.getDate()).padStart(2, '0') + ' ' +
            String(createdAt.getHours()).padStart(2, '0') + ':' +
            String(createdAt.getMinutes()).padStart(2, '0');

        news.created_at = formattedDate;

        res.render('news_detail', { news });
    });
});

module.exports = router;