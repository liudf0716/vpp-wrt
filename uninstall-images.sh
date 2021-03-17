#!/bin/sh
VPP_WRT_IMAGE_ID=`docker images --filter="reference=liudf0716/vpp-wrt" --quiet`
ETCD_IMAGE_ID=`docker images --filter="reference=quay.io/coreos/etcd" --quiet`

# stop all instance
docker stop vpp-wrt
docker stop etcd

# rm all instance
docker rm etcd
docker rm vpp-wrt

# rm all images
if [ ! -z "$VPP_WRT_IMAGE_ID" ]; then
  docker rmi $VPP_WRT_IMAGE_ID
fi

if [ ! -z "$ETCD_IMAGE_ID" ]; then
  docker rmi $ETCD_IMAGE_ID
fi
