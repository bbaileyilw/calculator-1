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

          // stage("Docker build") {
          //      steps {
          //           sh "docker build -t wbbdockerid/calculator:${BUILD_NUMBER} ."
          //      }
          // }

          // stage("Docker login") {
          //      steps {
          //           withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'docker-hub-credentials',
          //                      usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
          //                sh "docker login --username $USERNAME --password $PASSWORD"
          //           }
          //      }
          // }

          // stage("Docker push") {
          //      steps {
          //           sh "docker push wbbdockerid/calculator:${BUILD_NUMBER}"
          //      }
          // }

          // stage("Update version") {
          //      steps {
          //           sh "sed  -i 's/{{VERSION}}/${BUILD_NUMBER}/g' calculator.yaml"
          //      }
          // }
          
          // stage("Deploy to staging") {
          //      steps {
          //          withKubeConfig([credentialsId: 'kubernetes-token',
          //               serverUrl: 'https://712AB9B49CF089974C0EACC423442F4B.gr7.us-east-2.eks.amazonaws.com'
          //               ]) {
          //                   sh "kubectl apply -f calculator.yaml"
          //           }
          //      }
          // }


          // stage("Acceptance test") {
          //      steps {
          //           sleep 60
          //           sh "chmod +x acceptance-test.sh && ./acceptance-test.sh"
          //      }
          // }

/*
          stage("Release") {
               steps {
                    sh "kubectl config use-context production"
                    sh "kubectl apply -f hazelcast.yaml"
                    sh "kubectl apply -f calculator.yaml"
               }
          }
*/         
/* 
stage("Smoke test") {
              steps {
                  sleep 60
                  sh "chmod +x smoke-test.sh && ./smoke-test.sh"
              }
          }
 */
     }
}

