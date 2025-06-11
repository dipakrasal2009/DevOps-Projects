# File: Dockerfile
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y python3 python3-pip ssh ansible iputils-ping && \
    apt clean

RUN useradd -m ansible && \
    echo "ansible:ansible" | chpasswd && \
    mkdir -p /home/ansible/.ssh && \
    chown -R ansible:ansible /home/ansible/.ssh

CMD ["/bin/bash"]

