#!/bin/bash

WORKDIR=/test
mkdir -p $WORKDIR
rm -rf $WORKDIR/*


for DIR1 in $(seq 4)
do
   # echo $DIR1
   mkdir -p $WORKDIR/$DIR1
done