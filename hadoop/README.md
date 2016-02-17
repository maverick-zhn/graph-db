###Hadoop Docker Documentation

###Build

`build -t hadoop .`

###Run

`docker run --entrypoint /bin/bash -it hadoop`

Then

`$/root/docker_entrypoint.sh`


###Notes
* It creates the image but it does not assign tag
I ran:
`docker tag b3aae2484b09 maverickzhn/hadoop:latest`

