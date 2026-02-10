pipeline {
    agent any
    
    environment {
        PROJECT_PATH = '/home/ubuntu/waybeyond-devops-project'
    }
    
    stages {
        stage('Checkout Code') {
            steps {
                echo '📦 Checking out code from GitHub...'
                checkout([$class: 'GitSCM', 
                          branches: [[name: '*/main']], 
                          userRemoteConfigs: [[url: 'https://github.com/vaibhavjawanjal344/waybeyond-devops-project.git']]])
            }
        }
        
        stage('Install Dependencies') {
            steps {
                echo '📦 Installing dependencies...'
                sh '''
                    echo "Current directory: $(pwd)"
                    echo "Files in directory:"
                    ls -la
                    
                    # Check docker-compose
                    which docker-compose || echo "docker-compose not found"
                    docker-compose --version || true
                '''
            }
        }
        
        stage('Deploy Application') {
            steps {
                echo '🐳 Deploying with Docker Compose...'
                sh '''
                    # Go to the correct directory
                    cd /home/ubuntu/waybeyond-devops-project || cd .
                    
                    # Stop old containers
                    sudo docker-compose down || true
                    
                    # Build and start new containers
                    sudo docker-compose up -d --build
                    
                    # Wait for services to start
                    sleep 10
                    
                    echo "Deployment complete!"
                '''
            }
        }
        
        stage('Health Check') {
            steps {
                echo '🏥 Checking application health...'
                sh '''
                    echo "Checking if containers are running..."
                    sudo docker ps
                    
                    echo "Checking backend health..."
                    if curl -s -f http://localhost:5000/api/health > /dev/null; then
                        echo "✅ Backend is healthy!"
                        curl -s http://localhost:5000/api/health | head -5
                    else
                        echo "⚠️ Backend might be starting..."
                        sleep 5
                        curl -s http://localhost:5000/api/health || echo "Backend not ready yet"
                    fi
                    
                    echo "Checking frontend..."
                    curl -s -f http://localhost:3002 > /dev/null && echo "✅ Frontend is responding!" || echo "⚠️ Frontend not accessible"
                '''
            }
        }
    }
    
    post {
        success {
            echo '🎉 Pipeline succeeded! Deployment complete.'
            sh 'echo "Deployment completed at: $(date)"'
        }
        failure {
            echo '❌ Pipeline failed!'
            sh '''
                echo "Debug info:"
                sudo docker ps
                sudo docker-compose ps || true
                ls -la /home/ubuntu/waybeyond-devops-project || true
            '''
        }
        always {
            echo '📊 Pipeline finished at $(date)'
        }
    }
}
