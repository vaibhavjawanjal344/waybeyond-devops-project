const express = require('express');
const app = express();
app.get('/api/health', (req, res) => res.json({status: 'OK'}));
app.listen(5000, () => console.log('Test Backend:5000'));
