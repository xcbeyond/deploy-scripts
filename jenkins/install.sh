#/bin/sh

# create k8s resource
kubectl apply -f ./k8s-files/*

# install jenkins by helm.
helm install jenkins -n jenkins -f jenkins-values.yaml jenkins-chart