pipeline {
    agent any
    parameters {
        choice(
            choices: ['greeting' , 'silence'],
            description: '',
            name: 'REQUESTED_ACTION')
    }

    stages {
        stage('Run script with pipes') {
            steps {
                sh "echo testtesttest > result.txt"
            }
        }
        stage ('Speak') {
            steps {
                script {
                    if ( params.REQUESTED_ACTION == 'greeting' ) {
                        echo "Hello, bitwiseman!"
                        archiveArtifacts "result.txt"
                    } else {
                        echo "....."
                        archiveArtifacts "result.txt"
                    }
                }
            }
        }
    }
}

