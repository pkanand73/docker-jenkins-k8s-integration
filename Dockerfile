FROM openjdk:17
EXPOSE 8080
# Copy jar to custom location
ADD target/docker-jenkins-k8s-integration.jar docker-jenkins-k8s-integration.jar
ENTRYPOINT ["java", "-jar", "docker-jenkins-k8s-integration.jar"]
