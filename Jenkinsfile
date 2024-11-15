pipeline {
    agent any

    // Environment variablessss
    environment {
        GIT_BRANCH = sh(script: "git rev-parse --abbrev-ref HEAD", returnStdout: true).trim()
    }

    stages {
        stage('Validate PR') {
            when {
                expression { 
                    // Only build if the source branch is 'staging' and target branch is 'master'
                    GIT_BRANCH ==~ /PR-\d+/ && env.CHANGE_TARGET == 'main' && env.CHANGE_BRANCH == 'staging'
                }
            }
            steps {
                echo "Building PR from ${env.CHANGE_BRANCH} to ${env.CHANGE_TARGET}"
            }
        }
        stage('Build') {
            steps {
                echo 'Building the application.'
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
            echo 'Build succeeded!!!!'
        }
        failure {
            echo 'Build failed.'
        }
    }
}
