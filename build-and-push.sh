#! /usr/bin/env bash
#docker buildx build . --push -t registry.hnrglobal.com/haydonryan/centos-test:latest -k
docker buildx build .  -t haydonryan/centos-test:latest --load
docker tag haydonryan/centos-test:latest registry.hnrglobal.com:443/haydonryan/centos-test
docker push registry.hnrglobal.com:443/haydonryan/centos-test:latest


