#!/bin/bash
set -e # exit on error
set -o pipefail # return right most error code (or zero)
helm repo add bitnami https://charts.bitnami.com/bitnami
helm upgrade \
    --install \
    --namespace=cassandra \
    --create-namespace \
    cassandra bitnami/cassandra \
    --version 10.11.2 \
    --values=values.yaml
