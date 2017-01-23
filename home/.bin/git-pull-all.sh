#!/usr/bin/env bash

for d in */;
do cd $d && git checkout master && git pull && cd ..;
done
