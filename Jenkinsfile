pipeline {
    agent any
    environment {
        gitRepository = 'ssh://git@stash.concentricsky.com/doc/bitbucket-builder.git'
        projectName = 'bitbucket'
        registryCredential = 'dockerhub'
    }
    stages {
        stage('Checkout') {
            steps {
                // Cleaning build context
                deleteDir()

                // Checkout origin/develop branch of code
                git branch: scm.branches[0].name,
                        credentialsId: 'jenkins',
                        url: env.gitRepository
            }
        }
        stage('Setup') {
            steps {
                script {
                    gitHash = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%H'").trim()
                    hasTag = sh(returnStatus: true, script: "git describe --exact-match --tags ${gitHash}")
                    if (hasTag == 0) {
                        gitVersion = sh(returnStdout: true, script: "git describe --exact-match --tags ${gitHash}").trim()
                    } else {
                        gitVersion = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
                    }
                    echo gitVersion
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    registry = "concentricsky/${projectName}"
                    docker.withRegistry( '', registryCredential) {
                        image = docker.build registry + ":${gitVersion}"
                    }
                }
            }
        }
        stage('Publish'){
            steps {
                script {
                    registry = "concentricsky/${projectName}"
                    docker.withRegistry( '', registryCredential) {
                        image.push("${gitVersion}")
                        image.push("latest")
                    }
                }
            }
        }
    }
    post {
        always {
            sh "docker rmi concentricsky/${projectName}:${gitVersion}"
        }
    }
}
