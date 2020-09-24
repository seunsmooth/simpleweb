pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh ' rm -rf app'
                sh 'git clone https://github.com/seunsmooth/techbleat-website.git app '
            }
        }
        stage('build weather app Infrastructure') {
            steps {
                echo 'build Terraform infrastructure on AWS..'
                sh  'terraform init && terraform apply -auto-approve'
            }
        }
         stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
