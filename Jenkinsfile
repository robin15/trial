pipeline {
    agent any
    parameters {
        choice(
            choices: ['PatternA' , 'PatternB'],
            description: '',
            name: 'REQUESTED_ACTION')
    }

    stages {
        stage('Run script with pipes') {
            steps {
                sh "echo testtesttest > result.txt"
            }a
        }
        stage ('Speak') {
            when {
                expression { params.REQUESTED_ACTION == 'PatternA' }
            }
            steps {
                echo "Hello, bitwiseman!"
                archiveArtifacts "result.txt"
            }
        }
        stage ('Silence') {
            when {
                expression { params.REQUESTED_ACTION == 'PatternB' }
            }
            steps {
                echo "..."
                archiveArtifacts "result.txt"
            }
        }
    }
}
