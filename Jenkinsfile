
//checking changes 13


pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven"
    }

    stages {
         stage('Cleanup Workspace') {
            steps {
                cleanWs()
                sh """
                echo "Cleaned Up Workspace For Project"
                """
            }
        }
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/prajwalyb/microservice.git'

                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean install"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }

             stage('SonarQube analysis') {
                 steps{
    withSonarQubeEnv(installationName: 'SonarCloud') { // You can override the credential to be used
      sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar'
    }
                 }
  }
        stage('Deploy')
        {
            when{
            branch 'develop'
            }
            steps{
                script{
                    docker.withRegistry(
                    'https://448947842740.dkr.ecr.448947842740.dkr.ecr.us-east-2.amazonaws.com',
                        'ecr:448947842740.dkr.ecr.us-east-2.amazonaws.com:my.aws.credentials){
                        def myImage = docker.build('samplerepo')
                        myImage.push('<tag>')
                        }
                        
                    
                        
                }
            }
        }


        }
    }

