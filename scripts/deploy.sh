#!/bin/bash
# AWS EC2 Deployment Script for WayBeyond DevOps Assessment
echo "=== WayBeyond Application Deployment ==="

# 1. Launch EC2 Instance
echo "1. Launch an AWS EC2 instance:"
echo "   - AMI: Ubuntu Server 22.04 LTS"
echo "   - Instance Type: t2.micro (Free Tier)"
echo "   - Security Group: Open ports 22(SSH), 80(HTTP), 443(HTTPS), 3000(Frontend), 5000(Backend)"

# 2. Connect and Setup
echo ""
echo "2. Connect to the instance and run:"
echo "   ssh -i 'your-key.pem' ubuntu@EC2_PUBLIC_IP"
echo ""
echo "   # On the EC2 instance, execute:"
echo "   sudo apt update && sudo apt upgrade -y"
echo "   sudo apt install -y docker.io docker-compose git"
echo "   sudo systemctl start docker"
echo "   sudo systemctl enable docker"
echo "   sudo usermod -aG docker ubuntu"
echo "   # Note: Log out and back in for group changes"

# 3. Deploy Application
echo ""
echo "3. Deploy the application:"
echo "   git clone https://github.com/YOUR_USERNAME/waybeyond-devops-project.git"
echo "   cd waybeyond-devops-project"
echo "   docker-compose up --build -d"

# 4. Verification
echo ""
echo "4. Verify deployment:"
echo "   curl http://localhost:5000/api/health"
echo "   # Access frontend via EC2 Public IP: http://EC2_PUBLIC_IP:3000"

echo ""
echo "=== Deployment Instructions Complete ==="
