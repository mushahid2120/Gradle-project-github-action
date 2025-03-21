FROM adoptopenjdk/openjdk11
  
EXPOSE 8080
 
WORKDIR myapp

COPY *.jar ./myapp.jar

CMD ["java", "-jar", "myapp.jar"]
