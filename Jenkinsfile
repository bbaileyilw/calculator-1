pipeline {
     agent any
     triggers {
          pollSCM('* * * * *')
     }
     stages {
          stage("Compile") {
               steps {
                    sh "./gradlew compileJava"
               }
          }
          stage("Unit test") {
               steps {
                    sh "./gradlew test"
               }
          }
          stage("Code coverage") {
               steps {
                    sh "./gradlew jacocoTestReport"
                    sh "./gradlew jacocoTestCoverageVerification"
               }
          }
          stage("Static code analysis") {
               steps {
                    sh "./gradlew checkstyleMain"
               }
          }
          stage("Package") {
               steps {
                    sh "./gradlew build"
               }
          }

          stage("Docker build") {
               steps {
                    sh "docker build -t wbbdocker1/calculator ."
               }
          }

          stage("Docker login") {
               steps {
                    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'docker-hub-credentials',
                               usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
                         sh "docker login --username $USERNAME --password $PASSWORD"
                    }
               }
          }

          stage("Docker push") {
               steps {
                    sh "docker push wbbdocker1/calculator"
               }
          }
          
          stage("Deploy to staging") {
               steps {
                    sh "DOCKER_HOST=172.31.13.140:2375 docker run -d --rm -p 8765:8080 --name calculator wbbdocker1/calculator"
               }
          }

          stage("Acceptance test") {
               steps {
                    sleep 60
                    sh "./gradlew acceptanceTest -Dcalculator.url=http://172.31.13.140:8765"
               }
          }
          stage("Release") {
               steps {
                    sh "DOCKER_HOST=172.31.8.67:2375 docker stop calculator || truer"
                    sh "DOCKER_HOST=172.31.8.67:2375 docker run -d --rm -p 8765:8080 --name calculator wbbdocker1/calculator"
               }
          }
     }
     post {
          always {
               sh "DOCKER_HOST=172.31.13.140:2375 docker stop calculator"
          }
     }
}
