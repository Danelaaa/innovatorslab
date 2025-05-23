const express = require("express");
const { checkRole } = require("../middleware/authMiddleware");
const router = express.Router();
const { verifyToken } = require('../middleware/authMiddleware');
const db = require("../db/db");
const presentationRoutes  = require("../routes/presentations");
const { isAuthenticated } = require('../middleware/authMiddleware');
const { requestEmailChange, updateEmail } = require('../controllers/auth');
// Public routes
router.get("/", (req, res) => {
    res.render("home");
});

router.get("/register", (req, res) => {
    res.render("register");
});

router.get("/login", (req, res) => {
    res.render("login");
});
router.get('/create-quiz', checkRole(1), (req, res) => {
    // Generate 5 empty questions, each with 4 empty answers
    const questions = Array.from({ length: 5 }, () => ({
        answers: Array(4).fill('')
    }));

    res.render('create-quiz', { questions });
});
router.get("/course-progress",  (req, res) => {
    res.render("course-progress"); // Admin dashboard or page
});


router.get('/course_steps',checkRole(1),async (req, res) => {
    res.render("course_steps");
});
router.use("/admin/presentations",checkRole(1), presentationRoutes, (req, res) => {
    res.render('admin/presentations'); // Ensure correct path to your .hbs file
});

router.get('/admin/news',checkRole(1), function(req, res) {
    res.render('admin_add_news');
});
router.get("/statistics", checkRole(1), (req, res) => {
    res.render("statistics"); // Admin dashboard or page
});

router.get("/courses", (req, res) => {
    res.render("course-admin"); // Admin dashboard or page
});
router.get("/aboutus", (req, res) => {
    res.render("aboutus"); // Admin dashboard or page
});

router.get("/take-quiz", (req, res) => {
    res.render("take-quiz"); // Admin dashboard or page
});
router.get("/admin-quiz" , checkRole(1),(req, res) => {
    res.render("admin-quiz"); // Admin dashboard or page
});
// Inside your Express app setup
router.get('/terms', (req, res) => {
    res.render('terms'); // or res.sendFile(__dirname + '/public/terms.html') if static
  });
  
router.get("/course", (req, res) => {
    res.render("course"); // Admin dashboard or page
});
router.get("/user-quiz-results/:user_id/:quiz_id", (req, res) => {
    res.render("quiz-results");
});

router.get("/admin", verifyToken, checkRole(1), (req, res) => {
    res.render("admin"); // Admin dashboard or page
});



router.get('/home', isAuthenticated, (req, res) => {
    res.render('home'); // No need to pass userName directly, it's in res.locals now
});

router.get("/user", (req, res) => {
    res.render("user"); // Admin dashboard or page
});
router.get("/confirm-email", (req, res) => {
    res.render("confirm-email"); 
});
router.get('/profile', isAuthenticated, (req, res) => {
    res.render('profile'); // No need to pass userName directly, it's in res.locals now
});
router.get('/books_page', isAuthenticated, (req, res) => {
    res.render('books_page'); // Remove the leading slash
});
router.get('/search', isAuthenticated, (req, res) => {
    res.render('search_page'); // Remove the leading slash
});
router.get('/mybook',isAuthenticated,  (req, res) => {
    res.render('book_reserve'); // Remove the leading slash
});





module.exports = router;
