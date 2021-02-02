#!/bin/bash

kubernetes_version="v1.20.0"

# 下载需要的镜像(docker hub)
kubeadm config images list --kubernetes-version=${kubernetes_version} |sed -e 's/^/docker pull /g' -e 's#k8s.gcr.io#xcbeyond#g' |sh -x

# 重命名镜像
docker images |grep xcbeyond |awk '{print "docker tag ",$1":"$2,$1":"$2}' |sed -e 's#xcbeyond#k8s.gcr.io#2' |sh -x

# 删除xcbeyond镜像
docker images |grep xcbeyond |awk '{print "docker rmi ", $1":"$2}' |sh -x