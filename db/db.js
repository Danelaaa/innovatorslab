// db.js
const mysql = require('mysql2');
require('dotenv').config(); 
const db = mysql.createConnection({
    host: process.env.DATABASE_HOST || 'localhost',
    user: process.env.DATABASE_USER || 'root',
    password: process.env.DATABASE_PASSWORD || '1234',
    database: process.env.DATABASE || 'DanelaSQL'
});
console.log(process.env.DATABASE_HOST)
db.connect((err) => {
    
    if (err) {
        console.error('Error connecting to the database:', err);
        process.exit(1); // Exit if DB connection fails
    } else {
        console.log('Database connected successfully.');
    }
});

module.exports = db;
