#!/bin/bash

# Add git bach function to .bash_profile
echo "git_branch() {" >> $HOME/.bash_profile
echo "  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'" >> $HOME/.bash_profile
echo "}" >> $HOME/.bash_profile


INSTANCEID=$(/opt/aws/bin/ec2-metadata |grep instance-id| cut -c 14-80)
echo "INSTANCEID=$INSTANCEID" >> $HOME/.bash_profile
