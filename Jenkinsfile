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
                pwd
                ls 
                docker-compose -f compose-build.yaml build


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
                sh './$WORKSPACE/scripts/push.sh '
            }
        }

        stage('Deploy') {
            steps {
                sh './$WORKSPACE/scripts/deploy.sh '
            }
        }


    }
}