#!/bin/bash

service ssh start

/opt/hadoop/bin/hadoop namenode -format

# start process hadoop
/opt/hadoop/bin/start-all.sh
#/opt/hbase/bin/start-hbase.sh
jps


# TODO: open a shell to avoid stop the docker container. Maybe there is a better/elegant solution.
#/bin/bash

