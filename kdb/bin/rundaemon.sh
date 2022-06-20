#!/bin/bash

base_path=$(dirname $(readlink -f $0))
SRC_DIR=$base_path/../../

export PYTHONPATH=$PYTHONPATH:$KDB_CORE

mkdir -p /home/clarkem8/log

nohup python ${KDB_CORE}/daemon/rundaemon.py \
	-port 23000 \
	-pname rundaemon \
	>> /home/clarkem8/log/daemon.log 2>&1 & 
