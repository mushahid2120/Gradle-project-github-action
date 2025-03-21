FROM adoptopenjdk/openjdk11
  
EXPOSE 8080
 
WORKDIR myapp

RUN curl -u admin:redhat -O http://13.201.12.74:8081/com/example/my-app/2.1.1/my-app-2.1.1.jar



CMD ["java", "-jar", "my-app-2.1.1.jar"]
