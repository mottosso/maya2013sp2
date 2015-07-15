Based on [mottosso/mayabase-centos][1].

```yaml
size: 4.107 gb
compileTime: 5 mins
```

##### Usage

```bash
$ docker run -ti --rm mottosso/maya2015-centos mayapy
Python 2.7.3 (default, Aug  2 2012, 13:44:14)
[GCC 4.1.2] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> 
```

##### Introduction

Run Maya in CentOS using Docker.

[1]: https://gist.github.com/mottosso/a7f82e97b5ba31da0b38

##### Build (optional)

The image is automatically built and will be available via the above Usage instructions. But if you are interested in modifying or contributing to the Dockerfile, the following instructions can be helpful.

```bash
$ git clone https://github.com/mottosso/maya2015-centos.git && cd maya2015-centos
$ docker build -t mottosso/maya2015-centos .
```

###### Known issues

1. The `xgenm` module is not available.
2. The `Unfold3D` is not available.
