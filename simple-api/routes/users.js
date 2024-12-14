const express = require('express');
const router = express.Router();

let users = []; // In-memory storage

// Create a new user
router.post('/', (req, res) => {
  const { id, name, email } = req.body;
  if (!id || !name || !email) {
    return res.status(400).send({ message: 'Missing fields' });
  }
  users.push({ id, name, email });
  res.status(201).send({ message: 'User created', user: { id, name, email } });
});

// Get all users
router.get('/', (req, res) => {
  res.status(200).send(users);
});

// Get a user by ID
router.get('/:id', (req, res) => {
  const user = users.find(u => u.id === req.params.id);
  if (!user) {
    return res.status(404).send({ message: 'User not found' });
  }
  res.status(200).send(user);
});

// Update a user by ID
router.put('/:id', (req, res) => {
  const user = users.find(u => u.id === req.params.id);
  if (!user) {
    return res.status(404).send({ message: 'User not found' });
  }
  const { name, email } = req.body;
  user.name = name || user.name;
  user.email = email || user.email;
  res.status(200).send({ message: 'User updated', user });
});

// Delete a user by ID
router.delete('/:id', (req, res) => {
  users = users.filter(u => u.id !== req.params.id);
  res.status(200).send({ message: 'User deleted' });
});

module.exports = router;