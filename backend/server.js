const express = require('express');
const cors = require('cors');
const client = require('prom-client');

const app = express();
const PORT = 5000;

// Prometheus metrics
const register = new client.Registry();
register.setDefaultLabels({ app: 'waybeyond-backend' });
client.collectDefaultMetrics({ register });

app.use(cors());

// Health endpoint
app.get('/api/health', (req, res) => {
    res.json({ 
        status: 'OK',
        service: 'backend-api',
        timestamp: new Date().toISOString(),
        uptime: process.uptime()
    });
});

// Users endpoint
app.get('/api/users', (req, res) => {
    const users = [
        { id: 1, name: 'John Doe', email: 'john@waybeyond.com' },
        { id: 2, name: 'Jane Smith', email: 'jane@waybeyond.com' },
        { id: 3, name: 'Bob Johnson', email: 'bob@waybeyond.com' }
    ];
    res.json(users);
});

// Metrics endpoint for Prometheus
app.get('/metrics', async (req, res) => {
    res.set('Content-Type', register.contentType);
    res.end(await register.metrics());
});

app.listen(PORT, () => {
    console.log(' Backend server running on port ' + PORT);
    console.log(' Health check: http://localhost:' + PORT + '/api/health');
    console.log(' Metrics: http://localhost:' + PORT + '/metrics');
});
