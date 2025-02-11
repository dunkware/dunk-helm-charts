#!/bin/bash
set -e # exit on error
set -o pipefail # return right most error code (or zero)

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

helm upgrade \
    --install \
    keycloak bitnami/keycloak \
    --namespace keycloak \
    --create-namespace \
    --version 21.1.3 \
    --values=./values.yaml


echo