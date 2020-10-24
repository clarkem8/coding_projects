#!/bin/bash
echo "Running create AMI script"

s3_bucket="clarkem8-dev-store"

# Copy installs for rlwrap from s3
aws s3 cp s3://$s3_bucket/utilities/rlwrap /usr/bin/
aws s3 cp s3://$s3_bucket/utilities/libtinfo.so.5 /usr/bin/

# Get Ec2 instance tags
export GIT_REPO=coding_projects
export GIT_USER=clarkem8
export USER=clarkem8

# Add user
useradd $USER

if [[ "$INSTALL_FROM_S3" =~ "True" ]]; then
    echo "Installing from S3"
    # Download packages from S3 and install
    # path=echo $(dirname $0)
    # chmod 755 $path/install_packages.sh
    # $path/install_packages.sh
else
    yum install git -y
    GIT_PATH=/home/$USER/github/$GIT_REPO
    echo "Git path is - $GIT_PATH"
    sudo -i -u $USER git clone "https://github.com/$GIT_USER/$GIT_REPO.git" $GIT_PATH
    chmod 755 $GIT_PATH/AMI/install_packages.sh

    # Install packages
    $GIT_PATH/AMI/install_packages.sh

    # Install miniconda and run conda init post install
    chmod 755 $GIT_PATH/conda_envs/miniconda_install.sh
    sudo -i -u $USER $GIT_PATH/conda_envs/miniconda_install.sh
    sudo -i -u $USER /home/$USER/miniconda/bin/conda init
fi
