#!/bin/bash
set -e # exit on error
set -o pipefail # return right most error code (or zero)
helm repo add bitnami https://charts.bitnami.com/bitnami
helm upgrade \
    --install \
    --namespace=redis \
    --create-namespace \
    redis bitnami/redis \
    --version 18.1.1 \
    --values=values.yaml