#!/bin/bash
set -e # exit on error
set -o pipefail # return right most error code (or zero)

helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm repo update
helm upgrade \
    --install \
   dashboard kubernetes-dashboard/kubernetes-dashboard \
    --namespace dashboard \
    --create-namespace \
    --version 6.0.8 \
    --values=./values.yaml


kubectl apply -f ./ServiceAccount.yaml
kubectl apply -f ./ClusterRoleBinding.yaml
echo
echo "*********************************************************************************************"
echo "use the command  kubectl -n dashboard create token admin-user to get the token generated"
echo "*********************************************************************************************"
