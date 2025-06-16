# Base OS
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install system packages
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    git \
    curl \
    wget \
    unzip \
    sudo \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Optional: install Docker (if agent needs to run docker commands)
RUN curl -fsSL https://get.docker.com | sh

# Create user for Jenkins agent
RUN useradd -m -s /bin/bash jenkins

# Set environment variables
ENV JENKINS_AGENT_HOME /home/jenkins
ENV AGENT_WORKDIR /home/jenkins/agent
ENV JENKINS_URL http://jenkins-master:8080

# Set workdir
WORKDIR ${AGENT_WORKDIR}
RUN mkdir -p ${AGENT_WORKDIR}
RUN chown -R jenkins:jenkins ${JENKINS_AGENT_HOME}

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Switch to jenkins user
USER jenkins


# Entry point to connect the agent
ENTRYPOINT ["/entrypoint.sh"]

