pipeline {
    agent any
    
    environment {
        DOCKER_COMPOSE = 'docker-compose'
        PROJECT_NAME = 'devops-assignment'
    }
    
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', 
                url: 'https://github.com/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME.git'
                clean true
            }
        }
        
        stage('Build Docker Images') {
            steps {
                sh '''
                    echo "Building Docker images..."
                    docker-compose build --no-cache
                '''
            }
        }
        
        stage('Deploy Application') {
            steps {
                sh '''
                    echo "Stopping old containers..."
                    docker-compose down || true
                    
                    echo "Starting new containers..."
                    docker-compose up -d
                    
                    echo "Cleaning up unused Docker images..."
                    docker image prune -f
                '''
            }
        }
        
        stage('Health Check') {
            steps {
                sh '''
                    echo "Waiting for services to start..."
                    sleep 10
                    
                    echo "Checking backend health..."
                    curl -f http://localhost:5000/api/health || exit 1
                    
                    echo "Checking frontend..."
                    curl -f http://localhost:3002 || exit 1
                    
                    echo "All services are up!"
                '''
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline succeeded! Deployment complete.'
        }
        failure {
            echo 'Pipeline failed! Check logs above.'
        }
        always {
            echo 'Cleaning workspace...'
            cleanWs()
        }
    }
}
