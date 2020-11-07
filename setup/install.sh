#!/bin/bash

echo "Running $0"

## Configure aws cli
# Find aws region from metadata
REGION=$(/opt/aws/bin/ec2-metadata |grep placement|cut -c 11-20)

mkdir $HOME/.aws
echo "[default]" >> $HOME/.aws/config
echo "region=$REGION" >> $HOME/.aws/config
echo "output=json" >> $HOME/.aws/config

# Export TAGS to .env_vars

