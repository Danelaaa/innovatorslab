const express = require('express');
const router = express.Router();
const db = require('../db/db');
// Show activities page (reuses news data but hides "news" category in filter)


// Show activities page (exclude news with category 'news')
router.get('/', (req, res) => {
    const categoryId = req.query.category;

    let query = `
        SELECT news.*, news_categories.name AS category_name
        FROM news
        LEFT JOIN news_categories ON news.category_id = news_categories.id
        WHERE news_categories.name != 'news'
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

        // Also exclude 'news' from category filters
        db.query("SELECT * FROM news_categories WHERE name != 'news'", (err, categories) => {
            if (err) throw err;

            res.render('activities', {
                news: results,
                categories,
                selectedCategory: categoryId
            });
        });
    });
});


module.exports = router;