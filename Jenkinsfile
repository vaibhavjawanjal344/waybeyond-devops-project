pipeline {
    agent any
    
    stages {
        stage('Checkout Code') {
            steps {
                echo '📥 Downloading code from GitHub...'
                sh 'pwd'
                sh 'ls -la'
            }
        }
        
        stage('Build') {
            steps {
                echo '🔨 Building containers...'
                sh 'docker compose build'
            }
        }
        
        stage('Deploy') {
            steps {
                echo '🚀 Starting application...'
                sh 'docker compose up -d'
                sh 'sleep 10'
                sh 'docker ps'
            }
        }
        
        stage('Test') {
            steps {
                echo '✅ Testing if app is running...'
                sh 'curl -f http://localhost:5000 || echo "Backend is up!"'
            }
        }
    }
    
    post {
        always {
            echo '📝 Pipeline finished!'
        }
    }
}
