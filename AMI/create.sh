#!/bin/bash
echo "Running create AMI script"

# Get Ec2 instance tags
# GIT_REPO=
# GIT_USER=

# Add user
user="clarkem8"
useradd $user

s3_bucket="clarkem8-dev-store"
# Copy installs for rlwrap from s3
aws s3 cp s3://$s3_bucket/rlwrap /usr/bin/
aws s3 cp s3://$s3_bucket/libtinfo.so.5 /usr/bin/

if [[ "$INSTALL_FROM_S3" =~ "True" ]]; then
    # Download packages from S3 and install
    # path=echo $(dirname $0)
    # chmod 755 $path/install_packages.sh
    # $path/install_packages.sh
else
    git clone "https://github.com/$GIT_USER/$GIT_REPO.git" /home/$USER/github/GIT_REPO
    
fi
