pipeline {
    agent any
    stages {
        stage('Deploy') {
            steps {
                echo '🚀 Starting deployment...'
                sh '''
                    # Go to project directory
                    cd /home/ubuntu/waybeyond-devops-project
                    
                    # Stop and remove old containers
                    sudo docker-compose down || true
                    
                    # Start new containers
                    sudo docker-compose up -d
                    
                    # Check status
                    sleep 3
                    echo "Container status:"
                    sudo docker ps
                    
                    # Test backend
                    echo "Testing backend..."
                    curl -s http://localhost:5000/api/health || echo "Backend not ready yet"
                    
                    echo "✅ Deployment commands executed"
                '''
            }
        }
    }
}
