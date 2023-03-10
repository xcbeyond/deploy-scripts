#!/bin/bash

source_reop=
target_repo=192.168.1.1/istio

n=0

for line in $(cat images.list)
do
   images[$n]=$line
   ((n+=1))
done

for image in ${images[@]}
do
   docker pull ${source_reop}/${image}
   docker tag ${source_reop}/${image} ${target_repo}/${image}
   docker push ${target_repo}/${image}
   docker rmi ${source_reop}/${image} ${target_repo}/${image}
done
