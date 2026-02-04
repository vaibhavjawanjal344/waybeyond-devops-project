# WayBeyond DevOps Assessment Project

##  Working Services
1. **Backend API** (Node.js Express)
   - Port: 5000
   - Health: http://localhost:5000/api/health
   - Users: http://localhost:5000/api/users
   - Metrics: http://localhost:5000/metrics

2. **Frontend App** (Next.js React)
   - Port: 3002
   - URL: http://localhost:3002
   - Features: Connects to backend API

##  Technology Stack
- Frontend: Next.js 13.0.0 + React 18.2.0
- Backend: Node.js + Express + Prometheus metrics
- Development: Docker, VS Code, Windows

##  Next Steps for Complete Assessment
1. Create Dockerfiles for both services
2. Setup docker-compose.yml
3. Deploy to AWS EC2
4. Configure HTTPS with Certbot
5. Setup monitoring stack
