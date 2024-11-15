pipeline {
    agent any

    environment {
        GIT_BRANCH = sh(script: "git rev-parse --abbrev-ref HEAD", returnStdout: true).trim()
    }

    stages {
        stage('Validate PR') {
            when {
                allOf {
                    expression {
                        // Check if this is a pull request
                        return env.CHANGE_ID != null &&
                               env.CHANGE_TARGET == 'main' &&
                               env.CHANGE_BRANCH == 'staging'
                    }
                }
            }
            steps {
                echo "Triggering build for PR #${env.CHANGE_ID} from ${env.CHANGE_BRANCH} to ${env.CHANGE_TARGET}"
            }
        }
        stage('Build') {
            steps {
                echo 'Building the application...'
                // Add your build commands here (e.g., Maven, npm, etc.)
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                // Add your test commands here
            }
        }
    }

    post {
        success {
            echo 'Build succeeded!'
        }
        failure {
            echo 'Build failed.'
        }
    }
}
