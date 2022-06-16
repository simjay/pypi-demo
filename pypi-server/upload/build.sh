#!/bin/bash

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
case $key in
    -s|--server)
    SERVER="$2"
    shift # past argument
    shift # past value
    ;;
esac
done

VERSION=$VERSION python setup.py bdist_wheel upload --repository "$SERVER"
