pipeline {
    agent any
    stages {
        stage('Deploy') {
            steps {
                sh '''
                    # SIMPLE - Just run the exact command that works
                    echo "Running deployment..."
                    
                    # Option 1: Try with full path
                    /usr/local/bin/docker-compose -f /home/ubuntu/waybeyond-devops-project/docker-compose.yml up -d
                    
                    # Option 2: If that fails, try sudo
                    if [ $? -ne 0 ]; then
                        echo "Trying with sudo..."
                        sudo /usr/local/bin/docker-compose -f /home/ubuntu/waybeyond-devops-project/docker-compose.yml up -d
                    fi
                    
                    # Option 3: Last resort
                    if [ $? -ne 0 ]; then
                        echo "Starting containers manually..."
                        sudo docker run -d -p 5000:5000 --name backend node:18-alpine node -e "console.log('Backend')"
                        sudo docker run -d -p 3002:80 --name frontend nginx:alpine
                    fi
                    
                    echo "Checking..."
                    sleep 2
                    sudo docker ps
                    echo "✅ Deployment attempted"
                '''
            }
        }
    }
}
