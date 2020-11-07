#!/bin/bash

echo "Running $0"
base_path=$(dirname $(readlink -f $0))

## Configure aws cli
# Find aws region from metadata
REGION=$(/opt/aws/bin/ec2-metadata |grep placement|cut -c 11-20)
echo "REGION=$REGION" >> $HOME/.env_vars

mkdir $HOME/.aws
echo "[default]" >> $HOME/.aws/config
echo "region=$REGION" >> $HOME/.aws/config
echo "output=json" >> $HOME/.aws/config


# Setup user profile
$base_path/profile_setup.sh

# Export TAGS to .env_vars
$base_path/export_tags.sh
source $HOME/.env_vars

# Install packages
$base_path/install_packages.sh

# Add user and clone git repo
useradd $USER
GIT_PATH=/home/$USER/github/$GIT_REPO
echo "Git path is - $GIT_PATH"
git clone "https://github.com/$GIT_USER/$GIT_REPO.git" $GIT_PATH
