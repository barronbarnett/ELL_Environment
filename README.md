This docker file creates an Ubuntu 16.04 environment installing all the tools to build the [Microsoft Embedded Learning Libary](https://github.com/Microsoft/ELL).

To use this docker container. Clone this repository using `git clone --recursive git@github.com:barronbarnett/ELL_Environment.git`

Then from within the repository: 

```
ELL_Environment$ docker build . -t ell
ELL_Environment$ docker run -ti -v $(pwd)/root:/root -name ell_env
```

To build ELL you can just run build.sh
```
root@85a76a19a389:~# ./build.sh
``` 

The build output will be available to the host in the mounted volume within the git repository you pulled. Likewise you can edit or change code within that root folder and it will exist within the container.

If you need to build again in the future you can just start the container again:
```
$ docker start ell_env
$ docker attach ell_env
```

It is also possible to pull this container directly from docker:

```
$ docker run -ti -v (path to your source directory):/root barronbarnett/ell_env:latest -name ell_env
```