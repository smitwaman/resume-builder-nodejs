#!/bin/bash

# Create project directory
mkdir resumebuilder

# Navigate to project directory
cd resumebuilder

# Initialize Node.js project
npm init -y

# Create directory structure
mkdir src
mkdir public
mkdir views
mkdir models
mkdir routes
mkdir utils

# Create main server file
cat <<EOL > src/server.js
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
    console.log(\`Server is running on http://localhost:\${PORT}\`);
});
EOL

# Create main HTML file
cat <<EOL > public/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Resume Builder</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Welcome to Resume Builder</h1>
    <script src="scripts.js"></script>
</body>
</html>
EOL

# Create main CSS file
cat <<EOL > public/styles.css
body {
    font-family: Arial, sans-serif;
}
.tab-content {
    display: none;
}
EOL

# Create main JavaScript file
cat <<EOL > public/scripts.js
document.addEventListener('DOMContentLoaded', () => {
    const tabs = document.querySelectorAll('.tab-btn');

    tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            const tabContentId = tab.getAttribute('data-tab');
            const tabContent = document.getElementById(tabContentId);

            if (tabContent) {
                const allTabs = document.querySelectorAll('.tab-content');
                allTabs.forEach(t => t.style.display = 'none');

                tabContent.style.display = 'block';
            }
        });
    });
});
EOL

# Create views files
cat <<EOL > views/home.ejs
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home - Resume Builder</title>
</head>
<body>
    <h1>Welcome to Resume Builder</h1>
    <a href="/resume">Create Resume</a>
</body>
</html>
EOL

cat <<EOL > views/resume.ejs
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Resume - Resume Builder</title>
    <link rel="stylesheet" href="/styles.css">
</head>
<body>
    <h1>Create Your Resume</h1>

    <div class="tabs">
        <button class="tab-btn" data-tab="personal">Personal Information</button>
        <button class="tab-btn" data-tab="education">Education</button>
        <button class="tab-btn" data-tab="experience">Experience</button>
        <button class="tab-btn" data-tab="skills">Skills</button>
    </div>

    <div id="personal" class="tab-content">
        <h2>Personal Information</h2>
        <!-- Personal Information Form -->
    </div>

    <div id="education" class="tab-content">
        <h2>Education</h2>
        <!-- Education Form -->
    </div>

    <div id="experience" class="tab-content">
        <h2>Experience</h2>
        <!-- Experience Form -->
    </div>

    <div id="skills" class="tab-content">
        <h2>Skills</h2>
        <!-- Skills Form -->
    </div>

    <script src="/scripts.js"></script>
</body>
</html>
EOL

# Create models files
cat <<EOL > models/user.js
class User {
    constructor(name, email) {
        this.name = name;
        this.email = email;
    }
}

module.exports = User;
EOL

# Create routes files
cat <<EOL > routes/index.js
const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
    res.render('home');
});

router.get('/resume', (req, res) => {
    res.render('resume');
});

module.exports = router;
EOL

# Create utils files
touch utils/helper.js

# Display success message
echo "resumebuilder project structure with resume form has been created successfully!"
