#!/bin/bash

echo "Running $0"
base_path=$(dirname $(readlink -f $0))

# Add git bach function to .bash_profile
echo "" >> $HOME/.bash_profile
echo "parse_git_branch() {" >> $HOME/.bash_profile
echo "  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'" >> $HOME/.bash_profile
echo "}" >> $HOME/.bash_profile
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
echo "" >> $HOME/.bash_profile

echo "source $HOME/.env_vars" >> $HOME/.bash_profile
INSTANCEID=$(/opt/aws/bin/ec2-metadata |grep instance-id| cut -c 14-80)
echo "INSTANCEID=$INSTANCEID" >> $HOME/.env_vars
