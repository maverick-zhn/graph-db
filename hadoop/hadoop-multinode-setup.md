
# setting another java version as default version
```
maverick@ubuntu:/usr/lib/jvm$ sudo cp .java-1.6.0-openjdk-amd64.jinfo .java-6-openjdk-amd64.jinfo
maverick@ubuntu:/usr/lib/jvm$ sudo update-java-alternatives -s java-6-openjdk-amd64
update-alternatives: error: no alternatives for mozilla-javaplugin.so
update-java-alternatives: plugin alternative does not exist: /usr/lib/jvm/java-6-openjdk-amd64/jre/lib/amd64/IcedTeaPlugin.so
maverick@ubuntu:/usr/lib/jvm$ java -version
java version "1.6.0_38"
OpenJDK Runtime Environment (IcedTea6 1.13.10) (6b38-1.13.10-0ubuntu0.14.04.1)
OpenJDK 64-Bit Server VM (build 23.25-b01, mixed mode)
```

#ssh configuration, password less
```
ssh-keygen -t rsa -P ""
cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys
```

#hadoop 1.2.1
```
wget -O /tmp/hadoop-${HADOOP_VERSION}.tar.gz http://mirrors.sonic.net/apache/hadoop/common/hadoop-1.2.1/hadoop-1.2.1.tar.gz
```
```
maverick@ubuntu:~$ mv hadoop-1.2.1 hadoop
maverick@ubuntu:~$ sudo cp -rf hadoop /usr/local/.
```

```
maverick@ubuntu:/usr/local/hadoop/conf$ vi hadoop-env.sh 
maverick@ubuntu:/usr/local/hadoop/conf$ sudo mkdir -p /app/hadoop/tmp
sudo chown maverick:maverick /app/hadoop/tmp
```


#conf/core-site.xml

```
<configuration>
<property>
  <name>hadoop.tmp.dir</name>
  <value>/app/hadoop/tmp</value>
  <description>A base for other temporary directories.</description>
</property>

<property>
  <name>fs.default.name</name>
  <value>hdfs://localhost:54310</value>
  <description>The name of the default file system.  A URI whose
  scheme and authority determine the FileSystem implementation.  The
  uri's scheme determines the config property (fs.SCHEME.impl) naming
  the FileSystem implementation class.  The uri's authority is used to
  determine the host, port, etc. for a filesystem.</description>
</property>
</configuration>
```

#mapred-site.xml
```
maverick@ubuntu:/usr/local/hadoop/conf$ vi mapred-site.xml 

<property>
  <name>mapred.job.tracker</name>
  <value>localhost:54311</value>
  <description>The host and port that the MapReduce job tracker runs
  at.  If "local", then jobs are run in-process as a single map
  and reduce task.
  </description>
</property>
```

#conf/hdfs-site.xml
```
maverick@ubuntu:/usr/local/hadoop/conf$ vi hdfs-site.xml

maverick@ubuntu:/usr/local/hadoop/conf$ /usr/local/hadoop/bin/hadoop namenode -format
16/02/14 20:48:29 INFO namenode.NameNode: STARTUP_MSG: 
/************************************************************
STARTUP_MSG: Starting NameNode
STARTUP_MSG:   host = ubuntu/127.0.1.1
STARTUP_MSG:   args = [-format]
STARTUP_MSG:   version = 1.2.1
STARTUP_MSG:   build = https://svn.apache.org/repos/asf/hadoop/common/branches/branch-1.2 -r 1503152; compiled by 'mattf' on Mon Jul 22 15:23:09 PDT 2013
STARTUP_MSG:   java = 1.6.0_38
************************************************************/
16/02/14 20:48:30 INFO util.GSet: Computing capacity for map BlocksMap
16/02/14 20:48:30 INFO util.GSet: VM type       = 64-bit
16/02/14 20:48:30 INFO util.GSet: 2.0% max memory = 1013645312
16/02/14 20:48:30 INFO util.GSet: capacity      = 2^21 = 2097152 entries
16/02/14 20:48:30 INFO util.GSet: recommended=2097152, actual=2097152
16/02/14 20:48:30 INFO namenode.FSNamesystem: fsOwner=maverick
16/02/14 20:48:30 INFO namenode.FSNamesystem: supergroup=supergroup
16/02/14 20:48:30 INFO namenode.FSNamesystem: isPermissionEnabled=true
16/02/14 20:48:30 INFO namenode.FSNamesystem: dfs.block.invalidate.limit=100
16/02/14 20:48:30 INFO namenode.FSNamesystem: isAccessTokenEnabled=false accessKeyUpdateInterval=0 min(s), accessTokenLifetime=0 min(s)
16/02/14 20:48:30 INFO namenode.FSEditLog: dfs.namenode.edits.toleration.length = 0
16/02/14 20:48:30 INFO namenode.NameNode: Caching file names occuring more than 10 times 
16/02/14 20:48:30 INFO common.Storage: Image file /app/hadoop/tmp/dfs/name/current/fsimage of size 114 bytes saved in 0 seconds.
16/02/14 20:48:31 INFO namenode.FSEditLog: closing edit log: position=4, editlog=/app/hadoop/tmp/dfs/name/current/edits
16/02/14 20:48:31 INFO namenode.FSEditLog: close success: truncate to 4, editlog=/app/hadoop/tmp/dfs/name/current/edits
16/02/14 20:48:31 INFO common.Storage: Storage directory /app/hadoop/tmp/dfs/name has been successfully formatted.
16/02/14 20:48:31 INFO namenode.NameNode: SHUTDOWN_MSG: 
/************************************************************
SHUTDOWN_MSG: Shutting down NameNode at ubuntu/127.0.1.1
************************************************************/

#starting the single-node cluster
maverick@ubuntu:/usr/local/hadoop/conf$ /usr/local/hadoop/bin/start-all.sh
starting namenode, logging to /usr/local/hadoop/libexec/../logs/hadoop-maverick-namenode-ubuntu.out
localhost: starting datanode, logging to /usr/local/hadoop/libexec/../logs/hadoop-maverick-datanode-ubuntu.out
localhost: starting secondarynamenode, logging to /usr/local/hadoop/libexec/../logs/hadoop-maverick-secondarynamenode-ubuntu.out
starting jobtracker, logging to /usr/local/hadoop/libexec/../logs/hadoop-maverick-jobtracker-ubuntu.out
localhost: starting tasktracker, logging to /usr/local/hadoop/libexec/../logs/hadoop-maverick-tasktracker-ubuntu.out

maverick@ubuntu:/usr/local/hadoop/conf$ netstat -an | grep 'LISTEN*'
tcp        0      0 127.0.1.1:53            0.0.0.0:*               LISTEN     
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN     
tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN     
tcp6       0      0 :::50020                :::*                    LISTEN     
tcp6       0      0 :::34916                :::*                    LISTEN     
tcp6       0      0 127.0.0.1:54310         :::*                    LISTEN     
tcp6       0      0 127.0.0.1:54311         :::*                    LISTEN     
tcp6       0      0 :::50090                :::*                    LISTEN     
tcp6       0      0 :::50060                :::*                    LISTEN     
tcp6       0      0 127.0.0.1:40012         :::*                    LISTEN     
tcp6       0      0 :::50030                :::*                    LISTEN     
tcp6       0      0 :::60819                :::*                    LISTEN     
tcp6       0      0 :::50070                :::*                    LISTEN     
tcp6       0      0 :::22                   :::*                    LISTEN     
tcp6       0      0 ::1:631                 :::*                    LISTEN     
tcp6       0      0 :::58873                :::*                    LISTEN     
tcp6       0      0 :::50010                :::*                    LISTEN     
tcp6       0      0 :::50075                :::*                    LISTEN     
tcp6       0      0 :::58619                :::*                    LISTEN     
```

#stopping 
```
maverick@ubuntu:/usr/local/hadoop/conf$ /usr/local/hadoop/bin/stop-all.sh
stopping jobtracker
localhost: stopping tasktracker
stopping namenode
localhost: stopping datanode
localhost: stopping secondarynamenode
```

#testing wordcount on hadoop
```
maverick@ubuntu:/usr/local/hadoop$ bin/hadoop dfs -copyFromLocal /home/maverick/wordcount /user/maverick/wordcount
maverick@ubuntu:/usr/local/hadoop$ bin/hadoop jar hadoop*examples*.jar wordcount /user/maverick/wordcount /user/maverick/wordcount-output


maverick@ubuntu:/usr/local/hadoop$ bin/hadoop dfs -ls /user/maverick
Found 2 items
drwxr-xr-x   - maverick supergroup          0 2016-02-14 21:04 /user/maverick/wordcount
drwxr-xr-x   - maverick supergroup          0 2016-02-14 21:05 /user/maverick/wordcount-output
maverick@ubuntu:/usr/local/hadoop$ bin/hadoop dfs -ls /user/maverick/wordcount-output
Found 3 items
-rw-r--r--   1 maverick supergroup          0 2016-02-14 21:05 /user/maverick/wordcount-output/_SUCCESS
drwxr-xr-x   - maverick supergroup          0 2016-02-14 21:04 /user/maverick/wordcount-output/_logs
-rw-r--r--   1 maverick supergroup     258444 2016-02-14 21:05 /user/maverick/wordcount-output/part-r-00000
```

# increasing number of tasks
```
hduser@ubuntu:/usr/local/hadoop$ bin/hadoop jar hadoop*examples*.jar wordcount -D mapred.reduce.tasks=16 /user/hduser/gutenberg /user/hduser/gutenberg-output
```
# output
```
bin/hadoop dfs -cat /user/maverick/wordcount-output/part-r-00000
```

###TODO
* ~~Configure a Single-Node Cluster~~
* ~~Clone Virtual Machine~~
* ~~Backup Virtual Machine~~
* ~~Test SSH users and access on those two virtual machines~~
* Prepare new files for Multinode Installation
* Edit Hadoop Configuration Files
* Define Master and Slave
* Pending Tasks ...

###References
* http://www.michael-noll.com/tutorials/running-hadoop-on-ubuntu-linux-single-node-cluster/
* http://www.michael-noll.com/tutorials/running-hadoop-on-ubuntu-linux-multi-node-cluster/
