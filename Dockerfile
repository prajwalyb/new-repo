FROM openjdk:11
WORKDIR src/main/java/javaApp
EXPOSE 8080
ENTRYPOINT ["java","src/main/java/javaApp/Test.java"]
