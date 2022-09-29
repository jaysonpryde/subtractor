pipeline {
    agent {
        dockerfile {
            label 'docker'
        }
    }
    stages {
        stage('Hello GitHub') {
            steps {
                echo "Hello GitHub!"
            }
        }
        stage('Compile') {
            steps {
                sh 'python3 -m compileall subtractor.py'
            }
        }
        stage('Run') {
            steps {
                sh 'python3 subtractor.py 5 3'
            }
        }
        stage('Unit test') {
            steps {
                sh '''python3 -m pytest \
                    -v --junitxml=junit.xml \
                    --cov-report xml --cov subtractor subtractor.py
                '''
            }
        }
    }
    post {
        always {
            junit 'junit.xml'
            cobertura coberturaReportFile: 'coverage.xml'
        }
    }
}
