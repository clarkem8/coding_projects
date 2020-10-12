#!/bin/bash
echo "Running create AMI script"

useradd clarkem8
s3_bucket="clarkem8-dev-store"

# Copy installs for rlwrap from s3
aws s3 cp s3://$s3_bucket/rlwrap /usr/bin/
aws s3 cp s3://$s3_bucket/libtinfo.so.5 /usr/bin/

yum install git
