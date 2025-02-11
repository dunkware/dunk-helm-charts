#!/bin/bash
set -e # exit on error
set -o pipefail # return right most error code (or zero)
kubectl create namespace redis-cluster
helm repo add bitnami https://charts.bitnami.com/bitnami
#kubectl apply -f loadbalenceips.yaml
kubectl create configmap redis-cluster-default --namespace=redis-cluster --from-file=redisconfig.txt
helm install redis-cluster bitnami/redis-cluster --version 9.1.4 --values=r03-values.yaml --namespace=redis-cluster



