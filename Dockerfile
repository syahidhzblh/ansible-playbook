FROM ubuntu:latest

RUN apt update && \
    apt install -y openssh-server && \
    apt install -y ansible python3 net-tools

#Set Root user
RUN echo 'root:toor' | chpasswd

#Permit root login ssh
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Create privilege separation directory
RUN mkdir /run/sshd

#Start SSH Server when first run container
ENTRYPOINT [ "/usr/sbin/sshd", "-D" ]