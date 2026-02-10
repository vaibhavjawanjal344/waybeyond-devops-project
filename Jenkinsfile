pipeline {
    agent any
    stages {
        stage('Deploy') {
            steps {
                sh '''
                    # Check system
                    echo "User: \$(whoami)"
                    echo "Path: \$PATH"
                    
                    # Try docker-compose (WITH HYPHEN)
                    echo "Trying docker-compose..."
                    which docker-compose
                    docker-compose --version || echo "Trying /usr/local/bin/docker-compose"
                    /usr/local/bin/docker-compose --version || echo "docker-compose not found"
                    
                    # Deploy
                    echo "Deploying..."
                    cd /home/ubuntu/waybeyond-devops-project
                    sudo docker-compose down 2>/dev/null || true
                    sudo docker-compose up -d 2>/dev/null || docker-compose up -d
                    
                    # Verify
                    sleep 3
                    docker ps 2>/dev/null || sudo docker ps
                    echo "✅ Done"
                '''
            }
        }
    }
}
