#!/bin/bash
echo "Running create AMI script"

s3_bucket="clarkem8-dev-store"

# Copy installs for rlwrap from s3
aws s3 cp s3://$s3_bucket/rlwrap /usr/bin/
aws s3 cp s3://$s3_bucket/libtinfo.so.5 /usr/bin/

# Add user
useradd $USER

# Get Ec2 instance tags
export GIT_REPO=coding_projects
export GIT_USER=clarkem8
export USER=clarkem8

if [[ "$INSTALL_FROM_S3" =~ "True" ]]; then
    # Download packages from S3 and install
    # path=echo $(dirname $0)
    # chmod 755 $path/install_packages.sh
    # $path/install_packages.sh
else
    GIT_PATH=/home/$USER/github/$GIT_REPO
    git clone "https://github.com/$GIT_USER/$GIT_REPO.git" $GIT_PATH
    chmod 755 $GIT_PATH/AMI/install_packages.sh
    
    # Install packages
    $GIT_PATH/AMI/install_packages.sh
    
    # Install miniconda and run conda init post install
    chmod 755 $GIT_PATH/conda_envs/miniconda_install.sh
    sudo -i -u $USER $GIT_PATH/conda_envs/miniconda_install.sh
    sudo -i -u $USER /home/$USER/miniconda/bin/conda init
fi
