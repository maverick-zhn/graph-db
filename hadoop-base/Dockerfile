# Base image for Hadoop, HBase installation
# ssh enabled as described on https://docs.docker.com/engine/examples/running_ssh_service/

FROM ubuntu:14.04
MAINTAINER ebarsallo@purdue.edu servio@palacios.com
ENV REFRESHED AT 2016-02-16

USER root
WORKDIR /root

RUN apt-get update && apt-get install -y wget ssh rsync openjdk-6-jdk 
RUN ssh-keygen -q -t dsa -P '' -f /root/.ssh/id_dsa \ 
  && cat /root/.ssh/id_dsa.pub >> /root/.ssh/authorized_keys 

# sshd
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# ssh login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV JAVA_HOME /usr/lib/jvm/java-6-openjdk-amd64
ENV NOTVISIBLE "in users profile"

# sshd
RUN echo "export VISIBLE=now" >> /etc/profile

# Config ssh to accept all connections from unknow hosts. 
COPY conf/ssh_config /root/.ssh/config

EXPOSE 22

VOLUME [ "/root" ]

CMD ["/usr/sbin/sshd", "-D"]