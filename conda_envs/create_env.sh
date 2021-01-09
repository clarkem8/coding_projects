#!/bin/bash

echo "Running $0"
base_path=$(dirname $(readlink -f $0))
env=$1
echo "Creating conda env from - $env"
conda env create -f $base_path/yaml_files/${env}.yml

if [[ $env == "core" ]]; then
    "Pip installing coinbase pro package"
    pip install cbpro
fi
