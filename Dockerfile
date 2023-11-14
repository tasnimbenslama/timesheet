FROM maven:3.8.4 as build
COPY . .
RUN mvn install -X

FROM openjdk:11.0
WORKDIR /app
COPY --from=build /app/target/Uber.jar /app/
EXPOSE 8082
CMD ["java","-jar",Uber.jar"]
 

