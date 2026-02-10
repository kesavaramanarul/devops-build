const express = require('express');
const app = express();

app.get('/health', (req, res) => {
  res.status(200).send('OK');  // App is healthy
});

app.listen(80, () => console.log('App running on port 80'));
