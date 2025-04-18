#!/bin/bash

path=$1
bname=$(basename $path))
dname=$(dirname $path))
tar -cf ${path} | pigz -9 -p 32 > ${dname}/{bname}.archive.tar.gz
