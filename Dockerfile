# Dockerfile testing
FROM ubuntu:22.04

# Install Java and dependencies
RUN apt update && \
    apt install -y openjdk-17-jdk curl git && \
    apt clean

# Add Jenkins user
RUN useradd -m -s /bin/bash jenkins

# Set working directory
WORKDIR /home/jenkins

# Download Jenkins .war file
RUN curl -L -o jenkins.war https://get.jenkins.io/war-stable/latest/jenkins.war

# Expose port
EXPOSE 8080

# Run Jenkins
CMD ["java", "-jar", "jenkins.war"]

