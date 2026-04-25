From tomcat:8.0.51-jre8-alpine
RUN rm -rf /usr/local/tomcat/webapps/*
COPY ./target/airportadmin.war /usr/local/tomcat/webapps/ROOT.war
COPY ./target/mysql-connector-java-5.1.6.jar /usr/local/tomcat/lib/
COPY ./target/context.xml /usr/local/tomcat/conf/
#EXPOSE 8080
CMD ["catalina.sh","run"]
