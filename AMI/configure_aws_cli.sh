#!/bin/bash

mkdir $HOME/.aws
echo "[default]" >> $HOME/.aws/config
echo "region=us-east-2" >> $HOME/.aws/config
echo "output=json" >> $HOME/.aws/config
