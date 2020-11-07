#!/bin/bash

echo "Running $0"
base_path=$(dirname $(readlink -f $0))

## Configure aws cli
# Find aws region from metadata
REGION=$(/opt/aws/bin/ec2-metadata |grep placement|cut -c 11-20)

mkdir $HOME/.aws
echo "[default]" >> $HOME/.aws/config
echo "region=$REGION" >> $HOME/.aws/config
echo "output=json" >> $HOME/.aws/config

# Setup user profile
$base_path/profile_setup.sh

# Export TAGS to .env_vars
$base_path/profile_setup.sh
