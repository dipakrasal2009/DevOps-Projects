# Base image
FROM ubuntu:22.04

# Set non-interactive frontend
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required packages
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    git \
    curl \
    wget \
    gnupg2 \
    unzip \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Set Jenkins home and port
ENV JENKINS_HOME=/var/jenkins_home
ENV JENKINS_PORT=8080

# Create Jenkins user and directories
RUN useradd -m -d ${JENKINS_HOME} -s /bin/bash jenkins && \
    mkdir -p /usr/share/jenkins && \
    mkdir -p ${JENKINS_HOME} && \
    chown -R jenkins:jenkins ${JENKINS_HOME}

# Download Jenkins WAR file (latest LTS)
RUN wget -O /usr/share/jenkins/jenkins.war https://get.jenkins.io/war-stable/latest/jenkins.war

# Expose Jenkins port
EXPOSE ${JENKINS_PORT}

# Switch to Jenkins user
USER jenkins

# Set working directory
WORKDIR ${JENKINS_HOME}

# Start Jenkins
ENTRYPOINT ["java", "-jar", "/usr/share/jenkins/jenkins.war"]

