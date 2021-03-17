#!/bin/bash

docker run -d  --name etcd -p 2379:2379 -e ETCDCTL_API=3 quay.io/coreos/etcd /usr/local/bin/etcd -advertise-client-urls http://0.0.0.0:2379 -listen-client-urls http://0.0.0.0:2379

docker run -d  --name vpp-wrt -p 5002:5002 -p 9191:9191 --privileged liudf0716/vpp-wrt:20.09
