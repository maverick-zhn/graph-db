# Hadoop 1.x + HBase 
# Based on https://github.com/angelcervera/docker-hadoop
# Setup according to: (single node setup) https://hadoop.apache.org/docs/r1.2.1/single_node_setup.html
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
ENV HBASE_VERSION 0.98.2
ENV HBASE_PREFIX  /opt/hbase

# Install all dependencies 
RUN apt-get update && apt-get install -y wget ssh rsync openjdk-6-jdk 

# Environment variables
ENV JAVA_HOME /usr/lib/jvm/java-6-openjdk-amd64
ENV PATH $PATH:$HADOOP_PREFIX/bin

# Download hadoop
RUN wget -O /tmp/hadoop-${HADOOP_VERSION}.tar.gz http://mirrors.sonic.net/apache/hadoop/common/hadoop-1.2.1/hadoop-1.2.1.tar.gz

# Download hbase
RUN wget -O /tmp/hbase-${HBASE_VERSION}.tar.gz https://archive.apache.org/dist/hbase/hbase-0.98.2/hbase-0.98.2-hadoop1-bin.tar.gz

# Install hadoop 
RUN tar -C /opt -xf /tmp/hadoop-${HADOOP_VERSION}.tar.gz  \ 
  && ln -s /opt/hadoop-${HADOOP_VERSION} ${HADOOP_PREFIX} \ 
  && mkdir /var/lib/hadoop

# Install ssh key 
RUN ssh-keygen -q -t dsa -P '' -f /root/.ssh/id_dsa \ 
  && cat /root/.ssh/id_dsa.pub >> /root/.ssh/authorized_keys 

# Install hbase
RUN tar -C /opt -xf /tmp/hbase-${HBASE_VERSION}.tar.gz \ 
  && ln -s /opt/hbase-${HBASE_VERSION}-hadoop1 ${HBASE_PREFIX} 


# Config ssh to accept all connections from unknow hosts. 
COPY conf/hadoop_${HADOOP_VERSION}/ssh_config /root/.ssh/config

# Copy Hadoop config files 
COPY conf/hadoop_${HADOOP_VERSION}/core-site.xml   ${HADOOP_PREFIX}/conf/ 
COPY conf/hadoop_${HADOOP_VERSION}/hdfs-site.xml   ${HADOOP_PREFIX}/conf/ 
COPY conf/hadoop_${HADOOP_VERSION}/mapred-site.xml ${HADOOP_PREFIX}/conf/ 

# Setup JAVA_HOME, HADOOP_PREFIX
RUN sed -i "s|^# export JAVA_HOME.*$|export JAVA_HOME=${JAVA_HOME}\nexport HADOOP_PREFIX=${HADOOP_PREFIX}\n|" $HADOOP_PREFIX/conf/hadoop-env.sh

# Format hdfs 
RUN ${HADOOP_PREFIX}/bin/hadoop namenode -format

# Copy Hbase config files
COPY conf/hbase_${HBASE_VERSION}/hbase-env.sh   ${HBASE_PREFIX}/conf/ 
COPY conf/hbase_${HBASE_VERSION}/hbase-site.xml ${HBASE_PREFIX}/conf/ 

# Copy the entry point shell 
COPY conf/hadoop_${HADOOP_VERSION}/docker_entrypoint.sh /root/ 
RUN  chmod 700 /root/docker_entrypoint.sh

# Clean 
RUN rm -r /var/cache/apt /var/lib/apt/lists /tmp/hadoop-${HADOOP_VERSION}.tar* /tmp/hbase-${HBASE_VERSION}.tar*


### Expose ports

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


### Expose volumes

# logs
VOLUME [ "${HADOOP_PREFIX}/logs", "${HBASE_PREFIX}/logs" ]

### Entrypoint
#ENTRYPOINT [ "/root/docker_entrypoint.sh" ]