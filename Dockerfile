FROM tomcat
RUN apt update -y
RUN apt upgrade -y
RUN apt install vim -y
MAINTAINER TAMIL
COPY ./target/LoginApp.war /usr/local/tomcat/webapps/ROOT.war
COPY ./tomcat/*.xml /usr/local/tomcat/conf/
