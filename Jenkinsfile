pipeline {
    agent any
   
	environment {
		registry = "snehalhande42/docker-apache"
		img = "$registry" + ":${env.BUILD_ID}"
		registryCredential = 'docker-hub-login' 
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

         stage('Run') {
			steps{
				echo "Run image"
				sh returnStdout: true, script: "docker run --rm -d --name ${JOB_NAME} -p 81:80 ${img}"
			}
		}

        stage('Release') {
            steps {
				script {
					echo "Push to docker hub"
                    docker.withRegistry( 'https://registry.hub.docker.com ', registryCredential )  {
                            echo "${img}"
                            
							dockerImg.push()
							
						}
                }
            }

        }
    }
}