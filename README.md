# graph-db-dockers
Dockers related to Graph Databases (Hadoop, HBase, Titan, etc.)

###Docker related
* https://docs.docker.com/engine/reference/builder/
* http://crosbymichael.com/dockerfile-best-practices.html
* https://docs.docker.com/engine/userguide/containers/dockervolumes/

###Docker Repositories
* [Servio Palacios] https://hub.docker.com/r/maverickzhn/data/

###Hadoop
* https://hadoop.apache.org/docs/r2.7.2/hadoop-yarn/hadoop-yarn-site/DockerContainerExecutor.html
* [Hadoop 2.7.1 Docker image] https://github.com/sequenceiq/hadoop-docker
* [Multinode Docker] http://blog.sequenceiq.com/blog/2014/06/19/multinode-hadoop-cluster-on-docker/
* https://ambari.apache.org/

###Titan
* [docker] https://github.com/phani1kumar/docker-titan
* [docker] https://hub.docker.com/r/elubow/titan-gremlin/

###TO-DO LIST
* [Please check data-only directory]~~Check how to persist data when a container is close, and also accross different cointaner.~~
* ~~Check https://docs.docker.com/engine/userguide/containers/dockervolumes/~~
* ~~Check http://stackoverflow.com/questions/18496940/how-to-deal-with-persistent-storage-e-g-databases-in-docker~~
* Separate Hadoop and HBase in two containers.
* Create TitanDb and SOlr containers.

```
We should use volumes to persist data after closing one container [see data-only directory]
```
