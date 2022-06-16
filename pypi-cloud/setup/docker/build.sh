#!/usr/bin/env bash

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -v|--version)
    VERSION="$2"
    shift # past argument
    shift # past value
    ;;
esac
done

docker build -t simjay/pypi-cloud-demo:"$VERSION" .
docker push simjay/pypi-cloud-demo:"$VERSION"
