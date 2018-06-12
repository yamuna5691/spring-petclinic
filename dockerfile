FROM centos:6.9

FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/yamuna5691/spring-petclinic.git

FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY --from=clone /app/spring-petclinic /app
RUN mvn install

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/target/spring-petclinic-1.5.1.jar /app
CMD ["java -jar spring-petclinic0.5.1.jar"]
