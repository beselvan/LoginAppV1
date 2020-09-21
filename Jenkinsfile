pipeline {
    agent any

    stages {
        stage('GIT Clone') {
            steps {
                echo 'Cloning GIT repository'
		
            }
        }
        stage('Building Application') {
            steps {
                echo 'Maven Building Application'
		sh "mvn package"
		
            }
        }
        stage('Deploy') {
            steps {
                echo 'Docker Deploying Application'
		sh "cd $WORKSPACE"
		sh "whoami"
		sh "docker-compose down"
		sh "docker-compose up -d"
		
            }
        }
    }
}
