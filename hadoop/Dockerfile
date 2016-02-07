# idea taken from http://www.acervera.com/blog/2015/10/04/hadoop_singlenode_with_docker_from_scratch
# We based our new image on this
FROM ubuntu:14.04

# Authors
MAINTAINER ebarsallo@purdue.edu servio@palacios.com

# Every step in the build process will use this user
USER root

# Start folder
WORKDIR /root

# Environment variables
ENV HADOOP_VERSION 1.2.1 
ENV HADOOP_PREFIX /opt/hadoop

# Install all dependencies 
RUN apt-get update && apt-get install -y wget ssh rsync openjdk-7-jdk 

# Download hadoop
RUN wget -O /tmp/hadoop-${HADOOP_VERSION}.tar.gz http://mirrors.sonic.net/apache/hadoop/common/hadoop-1.2.1/hadoop-1.2.1.tar.gz

# Download Hbase
RUN wget https://archive.apache.org/dist/hbase/hbase-0.98.2/hbase-0.98.2-hadoop1-bin.tar.gz

# Install hadoop 
RUN tar -C /opt -xf /tmp/hadoop-${HADOOP_VERSION}.tar.gz \ 
  && ln -s /opt/hadoop-${HADOOP_VERSION} ${HADOOP_PREFIX} \ 
  && mkdir /var/lib/hadoop

# Install ssh key 
RUN ssh-keygen -q -t dsa -P '' -f /root/.ssh/id_dsa \ 
  && cat /root/.ssh/id_dsa.pub >> /root/.ssh/authorized_keys 


# Config ssh to accept all connections from unknow hosts. 
COPY config/ssh_config /root/.ssh/config

# Copy Hadoop config files 
COPY config/hadoop-env.sh ${HADOOP_PREFIX}/etc/hadoop/ 
COPY config/core-site.xml ${HADOOP_PREFIX}/etc/hadoop/ 
COPY config/hdfs-site.xml ${HADOOP_PREFIX}/etc/hadoop/ 
COPY config/mapred-site.xml ${HADOOP_PREFIX}/etc/hadoop/ 

# Format hdfs 
RUN ${HADOOP_PREFIX}/bin/hadoop namenode -format

# Copy the entry point shell 
COPY config/docker_entrypoint.sh /root/ 
RUN chmod a+x /root/docker_entrypoint.sh

# Clean 
RUN rm -r /var/cache/apt /var/lib/apt/lists /tmp/hadoop-${HADOOP_VERSION}.tar*

# Expose ports

# Zookeeper 
EXPOSE 2181 

# NameNode metadata service ( fs.defaultFS ) 
EXPOSE 9000 

# FTP Filesystem impl. (fs.ftp.host.port) 
EXPOSE 21 

# NameNode Web UI: Web UI to look at current status of HDFS, explore file system ....... 
EXPOSE 50070 50470 

# DataNode : DataNode WebUI to access the status, logs etc. (dfs.datanode.http.address / dfs.datanode.https.address) 
EXPOSE 50075 50475 

# DataNode (dfs.datanode.address / dfs.datanode.ipc.address) 
EXPOSE 50010 50020 

# Secondary NameNode (dfs.namenode.secondary.http-address / dfs.namenode.secondary.https-address) 
EXPOSE 50090 50090 

# Backup node (dfs.namenode.backup.address / dfs.namenode.backup.http-address) 
EXPOSE 50100 50105 

# Journal node (dfs.journalnode.rpc-address / dfs.journalnode.http-address / dfs.journalnode.https-address ) 
EXPOSE 8485 8480 848

