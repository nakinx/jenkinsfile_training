pipeline {
    agent any
    stages {
        stage('Main-Build') {
            when {
                branch 'main'
            }
            steps {
                echo 'Main Build'
            }
        }
        stage('Feature1-Build') {
            when {
                branch 'branch_feature_1'
            }
            steps {
                echo 'Feature 1 Build'
            }
        }
        stage('Test') {
            steps {
                echo 'Test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploy'
            }
        }
    }
}