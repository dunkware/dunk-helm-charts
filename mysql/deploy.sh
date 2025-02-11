#!/bin/bash
set -e # exit on error
set -o pipefail # return right most error code (or zero)
helm repo add bitnami https://charts.bitnami.com/bitnami
helm upgrade \
    --install \
    mysql bitnami/mysql \
    --namespace mysql \
    --create-namespace \
    --version 9.12.3 \
    --values=./values.yaml

