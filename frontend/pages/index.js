import { useState, useEffect } from 'react';

export default function Home() {
  const [health, setHealth] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch('http://localhost:5000/api/health')
      .then(res => res.json())
      .then(data => {
        setHealth(data);
        setLoading(false);
      })
      .catch(error => {
        console.error('Error:', error);
        setLoading(false);
      });
  }, []);

  return (
    <div style={{ padding: 20 }}>
      <h1>WayBeyond DevOps Assessment</h1>
      <p>Frontend running on: http://localhost:3002</p>
      <p>Backend running on: http://localhost:5000</p>
      
      <div style={{ background: '#f0f0f0', padding: 15, marginTop: 20 }}>
        <h2>Backend Status</h2>
        {loading ? (
          <p>Loading...</p>
        ) : health ? (
          <div>
            <p><strong>Status:</strong> {health.status}</p>
            <p><strong>Service:</strong> {health.service}</p>
            <p><strong>Uptime:</strong> {Math.floor(health.uptime)} seconds</p>
          </div>
        ) : (
          <p>Could not connect to backend</p>
        )}
      </div>
      
      <div style={{ marginTop: 20 }}>
        <h3>Test Links:</h3>
        <ul>
          <li><a href="http://localhost:5000/api/health" target="_blank">Backend Health API</a></li>
          <li><a href="http://localhost:5000/api/users" target="_blank">Backend Users API</a></li>
          <li><a href="http://localhost:3002" target="_blank">Frontend Home</a></li>
        </ul>
      </div>
    </div>
  );
}
