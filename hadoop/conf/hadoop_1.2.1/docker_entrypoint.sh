#!/bin/bash

service ssh start

# start process hadoop
/opt/hadoop/bin/start-all.sh
jps

/opt/hbase/bin/start-hbase.sh
jps


# TODO: open a shell to avoid stop the docker container. Maybe there is a better/elegant solution.
/bin/bash

