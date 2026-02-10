pipeline {
    agent any
    stages {
        stage('Deploy') {
            steps {
                sh '''
                    echo "=== SIMPLE DEPLOY ==="
                    cd /home/ubuntu/waybeyond-devops-project
                    pwd
                    ls -la docker-compose.yml
                    
                    # USE docker-compose WITH HYPHEN
                    /usr/local/bin/docker-compose version || docker-compose version
                    
                    # Deploy
                    /usr/local/bin/docker-compose down || true
                    /usr/local/bin/docker-compose up -d
                    
                    echo "Deployment done"
                '''
            }
        }
    }
}
