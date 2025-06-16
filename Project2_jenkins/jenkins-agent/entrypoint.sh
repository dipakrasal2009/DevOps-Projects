#!/bin/bash

# Download agent.jar if not exists
if [ ! -f agent.jar ]; then
  wget http://jenkins-master:8080/jnlpJars/agent.jar
fi

# Connect to Jenkins master using JNLP
exec java -jar agent.jar \
  -jnlpUrl http://jenkins-master:8080/computer/${JENKINS_AGENT_NAME}/jenkins-agent.jnlp \
  -secret ${JENKINS_AGENT_SECRET} \
  -workDir ${AGENT_WORKDIR}

