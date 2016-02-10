###Advanced Docker Volumes
 
 A volume can be a directory that is located outside of the root filesystem of your container. This allows you to import this directory in other containers. You can also use volumes to mount directories from your host machine inside a container. 

####Dockerfile example
```
FROM stackbrew/busybox:latest
MAINTAINER ebarsall@purdue.edu servio@palacios.com

# Create data directory
RUN mkdir /data

# Create /data volume
VOLUME /data
```

####Build
`docker build -t data .`

####Run
`docker run --name hadoop-data data true`

Notes:
* Erasing image `docker rmi -f 3e7763a97796`

####Example using volume
```
root@ubuntu:/var/lib/docker/volumes/e101d961b83e4e29aa7a7a5c4bbfef4ed551619a951eed6b5b4746e56af8d723# ls -al
total 12
drwxr-xr-x 3 root root 4096 Feb 10 01:39 .
drwx------ 4 root root 4096 Feb 10 01:39 ..
drwxr-xr-x 2 root root 4096 Feb 10 01:46 _data
root@ubuntu:/var/lib/docker/volumes/e101d961b83e4e29aa7a7a5c4bbfef4ed551619a951eed6b5b4746e56af8d723# cd _data/
root@ubuntu:/var/lib/docker/volumes/e101d961b83e4e29aa7a7a5c4bbfef4ed551619a951eed6b5b4746e56af8d723/_data# ls
fromcontainer
root@ubuntu:/var/lib/docker/volumes/e101d961b83e4e29aa7a7a5c4bbfef4ed551619a951eed6b5b4746e56af8d723/_data# docker run --volumes-from hadoop-data --entrypoint /bin/bash -it maverickzhn/hadoop
root@f0ee9fe79e9f:~# cd /data/
root@f0ee9fe79e9f:/data# ls
fromcontainer
root@f0ee9fe79e9f:/data# 
```

####Running hadoop docker with volumes
`docker run --volumes-from hadoop-data --entrypoint /bin/bash -it maverickzhn/hadoop`

Then run

```
root@f0ee9fe79e9f:/data# ls
fromcontainer
root@f0ee9fe79e9f:/data#
```

"fromcontainer" file is hosted in a volume in the host OS.


####Persistent Storage in Docker
* https://stackoverflow.com/questions/18496940/how-to-deal-with-persistent-storage-e-g-databases-in-docker
* http://www.offermann.us/2013/12/tiny-docker-pieces-loosely-joined.html
* http://crosbymichael.com/advanced-docker-volumes.html
* http://container42.com/2013/12/16/persistent-volumes-with-docker-container-as-volume-pattern/
