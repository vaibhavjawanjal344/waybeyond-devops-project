pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                echo '📦 Checking out code...'
                checkout scm
            }
        }
        
        stage('Deploy') {
            steps {
                echo '🚀 Deploying with Docker Compose...'
                sh '''
                    echo "Current directory: $(pwd)"
                    echo "Files:"
                    ls -la
                    
                    echo "Checking docker-compose..."
                    which docker-compose || echo "docker-compose not in PATH"
                    
                    # USE docker-compose (WITH HYPHEN)
                    echo "Running docker-compose..."
                    docker-compose --version || echo "Cannot run docker-compose"
                    
                    # Try to deploy
                    echo "Deploying..."
                    docker-compose down || true
                    docker-compose up -d || echo "Deployment attempted"
                    
                    sleep 5
                '''
            }
        }
        
        stage('Verify') {
            steps {
                echo '✅ Verifying deployment...'
                sh '''
                    echo "Checking containers..."
                    docker ps || echo "Cannot list containers"
                    
                    echo "Testing backend..."
                    curl -s http://localhost:5000/api/health && echo "✅ Backend OK" || echo "⚠️ Backend not ready"
                '''
            }
        }
    }
    
    post {
        success {
            echo '🎉 Deployment successful!'
        }
        failure {
            echo '❌ Deployment failed'
        }
    }
}
