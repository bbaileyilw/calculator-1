pipeline {
     agent any
     triggers {
          pollSCM('* * * * *')
     }
     stages {
          // stage("Compile") {
          //      steps {
          //           sh "./gradlew --no-daemon compileJava"
          //      }
          // }
          // stage("Unit test") {
          //      steps {
          //           sh "./gradlew --no-daemon test"
          //      }
          // }
          // stage("Static code analysis") {
          //      steps {
          //           sh "./gradlew --no-daemon checkstyleMain"
          //      }
          // }
          // stage("Package") {
          //      steps {
          //           sh "./gradlew --no-daemon build"
          //      }
          // }

          // stage("Docker build") {
          //      steps {
          //           sh "docker build -t wbbdocker1/calculator:${BUILD_NUMBER} ."
          //      }
          // }

          // stage("Docker login") {
          //      steps {
          //           // Credentials need to be set in Jenkins -> Manage
          //           withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'docker-hub-credentials',
          //                      usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
          //                sh "docker login --username $USERNAME --password $PASSWORD"
          //           }
          //      }
          // }

          // stage("Docker push") {
          //      steps {
          //           sh "docker push wbbdocker1/calculator:${BUILD_NUMBER}"
          //      }
          // }

          stage("Update Infra repo") {
               steps {
                    // Credentials need to be set in Jenkins -> Manage
                    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'github-credentials',
                               usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
                                             sh "git clone https://$USERNAME:$PASSWORD@github.com/bbaileyilw/wbinfra.git"
                                             sh "cd wbinfra"
                                             sh "echo wbbdocker1/calculator:3 > CALCULATOR_DOCKER_IMAGE"
                                             sh "git add CALCULATOR_DOCKER_IMAGE"
                                             sh "git commit -m 'Update calculator Docker Image'"
                                             sh "git push origin main" 
                    }
               }
          }

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

