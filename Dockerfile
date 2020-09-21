FROM tomcat
MAINTAINER TAMIL
COPY ./target/LoginApp.war /usr/local/tomcat/webapps/ROOT.war
COPY ./tomcat/*.xml /usr/local/tomcat/conf/
