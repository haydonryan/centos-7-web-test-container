# Centos 7 docker image for pushing to CF

To build the container:

```
docker pull centos:7
docker build -t centos-7-web-test-container .
docker save centos-7-web-test-container:latest | gzip > centos-7-web-test-container.tgz
```
