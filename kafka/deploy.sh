#!/bin/bash
set -e # exit on error
set -o pipefail # return right most error code (or zero)
helm repo add bitnami https://charts.bitnami.com/bitnami
helm upgrade \
    --install \
    kafka bitnami/kafka \
    --namespace kafka \
    --create-namespace \
    --version 30.1.5 \
    --values=values.yaml