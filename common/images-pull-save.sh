#!/bin/bash

n=0

for line in $(cat images.list)
do
   images[$n]=$line
   ((n+=1))
done

for image in ${images[@]}
do
   docker pull ${image}
   docker save -o ${image}.tar ${image}
done
