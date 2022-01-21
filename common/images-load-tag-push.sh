#!/bin/bash

repository=192.168.1.1/istio

n=0

for line in $(cat images.txt)
do
   images[$n]=$line
   ((n+=1))
done

for image in ${images[@]}
do
   docker pull ${image}
   docker save -o ${image}.tar ${image}
   # docker tag ${repository}/${image}
   # docker push ${repository}/${image}
   # docker rmi ${image} ${repository}/${image}
done
