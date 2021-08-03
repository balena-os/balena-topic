#!/bin/env groovy

pipeline {
    agent {
        node {
            label 'openembedded'
            customWorkspace 'balena-topic'
        }
    }

    stages {
        stage('Build') {
            steps {
                sh 'scripts/autobuild.sh'
            }
        }

        stage('Publish artifacts') {
            when { branch 'master' } // Only run this step on the master branch
            steps {
                archiveArtifacts artifacts: 'build/artefacts/*', onlyIfSuccessful: true
            }
        }
    }
}
