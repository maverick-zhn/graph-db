### Hadoop Docker Documentation

### Build

`build -t ebarsallo/hadoop:1.2.1 .`

### Run
```bat
docker create -v /db-data --name hadoop-ds ubuntu:14.01 /bin/true
docker run -d -P --volumes-from hadoop-ds -it -h hadoop-master -name hadoop-master ebarsallo/hadoop:1.2.1
```

or

```bat
docker run -d -P -v /db-data:/db-data -it -h hadoop-master -name hadoop-master ebarsallo/hadoop:1.2.1
```

### Notes
* It creates the image but it does not assign tag
I ran:
`docker tag b3aae2484b09 maverickzhn/hadoop:latest`

i
