const express = require('express');
const path = require('path');
const app = express();
const bodyParser = require('body-parser');
const userRoutes = require('./routes/users');

// Middleware
app.use(bodyParser.json());

// Serve static files from the "public" directory
app.use(express.static(path.join(__dirname, 'public')));

// Routes
app.use('/api/users', userRoutes);
app.get('/api/health', (req, res) => res.status(200).send({ status: 'OK' }));
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});