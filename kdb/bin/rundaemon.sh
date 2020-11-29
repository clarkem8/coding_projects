#!/bin/bash

export PYTHONPATH=$PYTHONPATH:$SRC_DIR/kdb
nohup python $SRC_DIR/kdb/daemon/rundaemon.py \
	-port 23000 \
	-pname rundaemon \
	>> /home/clarkem8/log/daemon.log 2>&1 & 
