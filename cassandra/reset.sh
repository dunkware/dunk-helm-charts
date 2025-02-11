#!/bin/bash
set -e # exit on error
set -o pipefail # return right most error code (or zero)

read -p "Do you want to reset installation of cassendre?(Y/n) " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
    helm uninstall cassandra --namespace cassandra 
    bash deploy.sh
fi
