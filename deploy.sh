#!/bin/bash
echo "=== DEPLOY SCRIPT ==="
cd /home/ubuntu/waybeyond-devops-project
sudo docker-compose down 2>/dev/null || true
sudo docker-compose up -d
sleep 3
sudo docker ps
curl -s http://localhost:5000/api/health && echo "✅ Backend OK" || echo "⚠️ Backend starting"
