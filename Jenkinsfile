pipeline {
    agent any

    environment {
        PASS = credentials('registry-pass')
    }

    stages {

        stage('Build') {
            steps {
                sh '''
                mvn -B -DskipTests clean package
                sudo ./scripts/build.sh

                '''

            }
        }

        stage('Test') {
            steps {
               sh 'mvn test'
            }
        }

        stage('Push') {
            steps {
                sh 'sudo ./scripts/push.sh '
            }
        }

        stage('Deploy') {
            steps {
                sh 'sudo ./scripts/deploy.sh '
            }
        }


    }
}