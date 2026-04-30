const express = require('express');
const mongoose = require('mongoose');
const app = express();

const PORT = process.env.PORT || 5000;
const MONGO_URI = process.env.MONGO_URI || 'mongodb://db:27017/devops_db';

mongoose.connect(MONGO_URI)
  .then(() => console.log('Connected to MongoDB'))
  .catch(err => console.error('DB Connection Error:', err));

app.get('/api/info', (req, res) => {
  res.json({ message: "Ողջույն DevOps նախագծից!", status: "Backend-ը աշխատում է" });
});

app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
