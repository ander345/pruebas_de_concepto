

FROM maven:3.8.6-eclipse-temurin-11-alpine AS build

COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

#war
#FROM tomcat:9.0.64-jre11-openjdk-slim-bullseye
#RUN rm -rvf /usr/local/tomcat/webapps/ROOT
#ADD  /target/trace-external-api-0.war /usr/local/tomcat/webapps/ROOT.war
#CMD ["catalina.sh", "run"]
#EXPOSE 8080

#jar
# Package stage
#
FROM openjdk:11-jdk-slim-buster

COPY --from=build /home/app/target/trace-external-api-0.jar /usr/local/lib/trace-external-api-0.jar

ENTRYPOINT ["java","-jar","/usr/local/lib/trace-external-api-0.jar"]