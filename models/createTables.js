// createTables.js
const db = require('../db/db');

// Create Categories Table
const createCategoryTable = `

CREATE TABLE IF NOT EXISTS category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
`;
// Create Books Table
const createBooksTable = `
use danelasql;
CREATE TABLE IF NOT EXISTS books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT,
    status VARCHAR(255),
    image VARCHAR(255),
    name VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES category(id)
);
`;

// Create Roles Table
const createRolesTable = `
CREATE TABLE IF NOT EXISTS roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);
`;



// Create Reservations Table
const createReservationsTable = `
CREATE TABLE IF NOT EXISTS reservations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    reserved_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);
`;

// Execute queries
db.query(createBooksTable, (err, result) => {
    if (err) {
        console.error('Error creating books table:', err.stack);
    } else {
        console.log('Books table created or already exists');
    }
});

db.query(createRolesTable, (err, result) => {
    if (err) {
        console.error('Error creating roles table:', err.stack);
    } else {
        console.log('Roles table created or already exists');
    }
});

db.query(createCategoryTable, (err, result) => {
    if (err) {
        console.error('Error creating category table:', err.stack);
    } else {
        console.log('Category table created or already exists');
    }
});

db.query(createReservationsTable, (err, result) => {
    if (err) {
        console.error('Error creating reservations table:', err.stack);
    } else {
        console.log('Reservations table created or already exists');
    }
});
db.end();