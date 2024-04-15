const express = require('express');
const path = require('path');

const app = express();
const PORT = 3000;

app.use(express.static(path.join(__dirname, '../public')));

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../views/home.ejs'));
});

app.get('/resume', (req, res) => {
    res.render('resume');
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
