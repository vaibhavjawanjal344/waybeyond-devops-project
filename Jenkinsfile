pipeline {
    agent any
    stages {
        stage('Run Deploy Script') {
            steps {
                sh '''
                    echo "Running deploy script on server..."
                    ssh -o StrictHostKeyChecking=no ubuntu@localhost "cd /home/ubuntu/waybeyond-devops-project && ./deploy.sh"
                '''
            }
        }
    }
}
