FROM tomcat:latest
# Dummy text to test 
COPY target/webappExample.war /usr/local/tomcat/webapps/webappExample.war
