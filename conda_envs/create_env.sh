#!/bin/bash

echo "Running $0"
base_path=$(dirname $(readlink -f $0))
env=$1
echo "Creating conda env from - $base_path/yaml_files/${env}.yml"
conda env create -f $base_path/yaml_files/${env}.yml
