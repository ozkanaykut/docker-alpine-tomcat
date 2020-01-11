pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'docker projesi derleniyor'
				sh "docker build -t jenkins-demo-02 ."
            }
        }
        stage('Test') {
            steps {
                echo 'docker container listesi aliniyor'
				sh "docker ps -a"
            }
        }
        stage('Deploy') {
            steps {
                echo 'docker images listesi aliniyor'
				sh "docker images"
            }
        }
    	stage('Finished') {
            steps {
                echo 'docker images siliniyor'
				sh "docker rmi -f jenkins-demo-02"
		echo 'proje klasoru ve icerigi '
		    		sh "pwd && ls -la"
            }
        }
    }
}
