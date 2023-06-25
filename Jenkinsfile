pipeline {
    agent any
   
	environment {
		registry = "snehalhhande/JenkinsTrial"
		img = "$registry" + ":${env.BUILD_ID}"
		//registryCredential = 'docker-hub-login' 
    }	

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/snehalhhande/JenkinsTrial.git'
                sh 'ls -la'
            }
        }
		
        stage('Build') {
            steps {
				echo "Building our image"
				script {
					dockerImg = docker.build("${img}")
                    //sh 'docker build -t snehalhhande/trialJenkins .'
                }
            }
        }
    }
}