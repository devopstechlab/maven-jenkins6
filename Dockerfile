FROM maven:3.9.9-eclipse-temurin-11 AS builder

WORKDIR /app

COPY . .

RUN mvn package

# Tomcat Server Setup
FROM tomcat:11.0.2-jdk21-temurin-noble

WORKDIR /usr/local/tomcat/webapps

COPY --from=builder /app/webapp/target/*.war .

EXPOSE 8080

CMD ["catalina.sh", "run"]
