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
                sh '''
                    echo "**************************************"
                    echo "********** Pushing Image *************"
                    echo "**************************************"

                    IMAGE="mavenproject"
                    LOCAL_IMAGE="app"


                    echo "****** Logging In ************"
                    docker login -u jpelegrino -p $PASS
                    echo "***Tagging Image **************"
                    docker tag $LOCAL_IMAGE:$BUILD_TAG jpelegrino/$IMAGE:$BUILD_TAG
                    echo "********** Pushing ************"
                    docker push jpelegrino/$IMAGE:$BUILD_TAG

                    '''
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker compose -f compose-deploy.yaml up '
            }
        }


    }
}