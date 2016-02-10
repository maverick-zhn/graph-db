docker build -t data .



docker run --name hadoop-data data true


docker rmi -f 3e7763a97796



root@ubuntu:/var/lib/docker/volumes/ef347d4696488561723a018c350e875c4517b60d8593e303e46decb27494367e# cd ..
root@ubuntu:/var/lib/docker/volumes# ls
e101d961b83e4e29aa7a7a5c4bbfef4ed551619a951eed6b5b4746e56af8d723
ef347d4696488561723a018c350e875c4517b60d8593e303e46decb27494367e
root@ubuntu:/var/lib/docker/volumes# cd e101d961b83e4e29aa7a7a5c4bbfef4ed551619a951eed6b5b4746e56af8d723/
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

