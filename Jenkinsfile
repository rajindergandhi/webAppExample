node{
     
    stage('SCM Checkout'){
        git url: 'https://github.com/rajindergandhi/webAppExample.git',branch: 'master'
    }
    
    stage(" Maven Clean Package"){
      def mavenHome = tool name: 'MAVEN', type: 'maven'
      def mavenCMD = "${mavenHome}/bin/mvn"
      sh "${mavenCMD} clean package"
      
    } 
    
    
    stage('Build Docker Image'){
       def dockerHome = tool name: 'Docker', type: 'dockerTool'
       sh 'docker build -t rajindergandhi/webappexample .'
    }
    
    stage('Push Docker Image'){
        withCredentials([string(credentialsId: 'docker', variable: 'Docker_Hub_Pwd')]) {
          sh "docker login -u rajindergandhi -p ${Docker_Hub_Pwd}"
        }
        sh 'docker push rajindergandhi/webAppExample'
     }
     
      stage('Run Docker Image In Dev Server'){
        
        def dockerRun = ' docker run  -d -p 8080:8080 --name java-web-app rajindergandhi/webAppExample'
         
               
    }
   
    
}
