#!/bin/bash

env_yml=$1
echo "Creating conda env from - $env_yml"
conda env create -f yaml_fies/$env_yml
