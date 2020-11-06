#!/bin/bash

INSTANCEID=$(/opt/aws/bin/ec2-metadata) |grep instance-id| cut -c 14-80
echo "INSTANCEID=$INSTANCEID" > $HOME/.bash_profile
