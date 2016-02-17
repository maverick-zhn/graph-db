###HBase Docker Documentation

###Build

`build -t ebarsallo/hbase:0.98.2-hadoop1 .`

###Run
```bat
docker run -d -P -it -h hbase-master -name hbase-master ebarsallo/hbase:0.98.2-hadoop1
```

###Useful commands
Check all running/not running dockers process
```
docker ps -a
```

Get IP assigned
```
docker inspect {name} | grep IPAddress
```

Get ports map
```
docker port {name}
```

###Connect
```bat
ssh root@{ip}
```
The password is: **screencast**

