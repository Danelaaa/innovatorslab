const jwt = require('jsonwebtoken');
const mysql = require('mysql2');

// Database connection
const db = mysql.createConnection({
    host: process.env.DATABASE_HOST,
    user: process.env.DATABASE_USER,
    password: process.env.DATABASE_PASSWORD,
    database: process.env.DATABASE
});

// Middleware to verify JWT and check user role_id
exports.checkRole = (role_id) => {
    return (req, res, next) => {
        const token = req.cookies.jwt;

        if (!token) {
            return res.status(401).redirect('/login');
        }

        jwt.verify(token, process.env.JWT_SECRET, (err, decodedToken) => {
            if (err) {
                return res.status(401).redirect('/login');
            }

            const userId = decodedToken.id;

            // Query the database to get the user and check their role_id
            db.query('SELECT * FROM users WHERE id = ?', [userId], (error, results) => {
                if (error || results.length === 0) {
                    return res.status(500).send('Internal server error');
                }

                const user = results[0];

                if (user.role_id !== role_id) {
                    return res.status(403).send('Access denied');
                }

                // Role matches, attach user information to request and proceed
                req.user = user;
                next();
            });
        });
    };
};

exports.isAuthenticated = (req, res, next) => {
    const token = req.cookies.jwt; 

    if (!token) {
        return res.redirect('/login'); 
    }

    jwt.verify(token, process.env.JWT_SECRET, (err, decodedToken) => {
        if (err) {
            console.log('Failed to authenticate token:', err);
            return res.status(403).json({ message: 'Failed to authenticate token' }); 
        }

        req.user = decodedToken; 

        res.locals.userName = decodedToken.name;
        res.locals.userId = decodedToken.id;    
        next(); 
    });
};

exports.verifyToken = (req, res, next) => {
    const token = req.cookies.jwt;

    if (!token) {
        return res.status(401).redirect('/login'); // Redirect to login if no token
    }

    jwt.verify(token, process.env.JWT_SECRET, (err, decoded) => {
        if (err) {
            console.log('❌ Token verification failed:', err.message);
            return res.status(403).redirect('/login'); // Invalid token
        }

        console.log('✅ Decoded user:', decoded);
        req.user = decoded; // Store user data in req.user
        next(); // Proceed to the next middleware
    });
};

exports.verifyUser = (req, res, next) => {
    const token = req.cookies.jwt;

    if (!token) {
        return res.status(401).json({ error: 'Unauthorized: No token provided' });
    }

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        req.user = decoded; // Store user data in `req.user`
        next(); // Proceed to next middleware
    } catch (err) {
        return res.status(401).json({ error: 'Unauthorized: Invalid token' });
    }
};
