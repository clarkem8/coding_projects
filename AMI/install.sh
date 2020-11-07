#!/bin/bash

echo "Running $0"
base_path=echo $(dirname $0)

## Configure aws cli
# Find aws region from metadata
REGION=$(/opt/aws/bin/ec2-metadata |grep placement|cut -c 11-20)

mkdir $HOME/.aws
echo "[default]" >> $HOME/.aws/config
echo "region=$REGION" >> $HOME/.aws/config
echo "output=json" >> $HOME/.aws/config

# Source utils script
source "$base_path/../aws/utils.sh"
INSTANCE_NAME=echo $(get_ec2_tag Name)
echo "Instance name is - $INSTANCE_NAME"
