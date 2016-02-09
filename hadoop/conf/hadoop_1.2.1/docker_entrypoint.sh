#!/bin/bash

service ssh start
/opt/hadoop/bin/start-all.sh

# TODO: open a shell to avoid stop the docker container. Maybe there is a better/elegant solution.
/bin/bash

