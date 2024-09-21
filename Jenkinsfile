pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                sh '''
                mvn -B -DskipTests clean package
                ./scripts/build.sh

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
                sh './scripts/push.sh '
            }
        }

        stage('Deploy') {
            steps {
                sh './scripts/deploy.sh '
            }
        }


    }
}