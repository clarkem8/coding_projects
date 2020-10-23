#!/bin/bash
  
# Download miniconda
wget https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh -P $HOME/installs/
chmod 755 $HOME/installs/*

# Install miniconda
# -p to install into particular directory
# -b to install in batch and agree to terms
# -u to update an existing install if it exists
$HOME/installs/Anaconda3-2019.03-Linux-x86_64.sh -b -u -p $HOME/
