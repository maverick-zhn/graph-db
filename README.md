# graph-db-dockers (on hold)
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
* http://s3.thinkaurelius.com/docs/titan/0.5.4/gremlin.html
* http://gremlindocs.spmallette.documentup.com/
* https://github.com/thinkaurelius/titan/blob/titan09/titan-core/src/main/java/com/thinkaurelius/titan/example/GraphOfTheGodsFactory.java
* http://s3.thinkaurelius.com/docs/titan/1.0.0/configuration.html
* https://www.youtube.com/watch?v=ZkAYA4Kd8JE

###Graph DB additional info
* http://markorodriguez.com/
* http://www.datastax.com/dev/blog/the-benefits-of-the-gremlin-graph-traversal-machine
* https://tinkerpop.incubator.apache.org/ 

###TO-DO LIST
* [Please check data-only directory]~~Check how to persist data when a container is close, and also accross different cointaner.~~
* ~~Check https://docs.docker.com/engine/userguide/containers/dockervolumes/~~
* ~~Check http://stackoverflow.com/questions/18496940/how-to-deal-with-persistent-storage-e-g-databases-in-docker~~
* Separate Hadoop and HBase in two containers.
* Create TitanDb and SOlr containers.

###NOTES
* Check: [kiwenlau](http://kiwenlau.blogspot.com/2015/05/quickly-build-arbitrary-size-hadoop.html), [alvinhenrick](https://github.com/alvinhenrick/hadoop-mutinode) docker implementations for hadoop multi nodes deploys on one machine.
* Check: [Bluedata EPIC Lite](http://info.bluedata.com/EPIC_Lite_Download_Request.html), [Swarm Github](https://github.com/docker/swarm/), [Swarm](https://docs.docker.com/swarm/), [Docker Composer](https://docs.docker.com/compose/) for deploy cluster solutions on docker.

```
We should use volumes to persist data after closing one container [see data-only directory]
```
