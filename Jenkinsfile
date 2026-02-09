pipeline {
    agent any

    environment {
        DOCKER_USER  = 'kesavan371'
        DOCKER_CREDS = 'fe477cf2-747e-4712-8a6c-69035287b04d'
    }

    stages {
        stage('Build & Push') {
            steps {
                script {
                    // Define repositories
                    def DEV_REPO  = "${env.DOCKER_USER}/dev"
                    def PROD_REPO = "${env.DOCKER_USER}/prod"

                    def targetRepo = ""

                    if (env.BRANCH_NAME == 'dev') {
                        targetRepo = DEV_REPO
                        echo "Targeting DEV repository: ${targetRepo}"

                    } else if (env.BRANCH_NAME == 'main' || env.BRANCH_NAME == 'master') {
                        targetRepo = PROD_REPO
                        echo "Targeting PROD repository: ${targetRepo}"

                    } else {
                        error "Pushing images for branch ${env.BRANCH_NAME} is not allowed."
                    }

                    def img = docker.build("${targetRepo}:${env.BUILD_NUMBER}")

                    docker.withRegistry('https://index.docker.io/v1/', env.DOCKER_CREDS) {
                        img.push()
                        img.push('latest')
                    }
                }
            }
        }
    }
}
