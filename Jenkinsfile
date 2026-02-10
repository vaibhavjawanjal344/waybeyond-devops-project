pipeline {
    agent any
    
    stages {
        stage('Deploy') {
            steps {
                echo '🚀 Starting deployment...'
                sh '''
                    # Run deploy script directly
                    echo "Current user: $(whoami)"
                    echo "Running deploy script..."
                    
                    # Go to project directory
                    cd /home/ubuntu/waybeyond-devops-project
                    
                    # Run the deploy script
                    chmod +x deploy.sh
                    ./deploy.sh
                    
                    echo "✅ Deployment completed"
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
