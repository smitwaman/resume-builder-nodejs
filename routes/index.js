const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
    res.render('home');
});

router.get('/resume', (req, res) => {
    res.render('resume');
});

module.exports = router;
