#!/bin/bash
set -e # exit on error
set -o pipefail # return right most error code (or zero)


read -p "Do you really want to destroy these resources?(Y/n) " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
    helm uninstall mysql --namespace mysql 
fi
