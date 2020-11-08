#!/bin/bash

echo "Running $0"
base_path=$(dirname $(readlink -f $0))

## Configure aws cli
# Find aws region from metadata
REGION=$(/opt/aws/bin/ec2-metadata |grep placement|cut -c 12-20)
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

# Clone git repo
GIT_PATH=$HOME/github/$GIT_REPO
if [[ ! -d $GIT_PATH ]]; then
    echo "Git path is - $GIT_PATH"
    git clone "https://github.com/$GIT_USER/$GIT_REPO.git" $GIT_PATH
fi
