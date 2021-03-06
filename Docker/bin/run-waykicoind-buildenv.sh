#!/bin/bash

# Usage: launch a container to build WaykiChain source code from github repo
#
NET=$1
WORK_DIR=$2
SRC_DIR=$3

[ -z "$NET" ] && NET=testnet
 
docker run --name waykicoind \
       -p8920:8920 -p6967:6967 -p6968:6968 \
       -v $WORK_DIR/conf/WaykiChain.conf:/root/.WaykiChain/WaykiChain.conf \
       -v $WORK_DIR/data:/root/.WaykiChain/$NET \
       -v $WORK_DIR/bin:/opt/wicc/bin \
       -v $SRC_DIR:/opt/wicc/src:rw \
       -it wicc/waykicoind bash