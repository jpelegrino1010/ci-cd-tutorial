FROM openjdk:21

COPY target/ci-cd-tutorial.jar ci-cd-tutorial.jar

CMD ["java", "-jar", "ci-cd-tutorial.jar"]