#!/bin/bash

get_ec2_tags () {
    aws ec2 describe-tags --filters "Name=resource-id,Values=i-1234567890abcdef8"
}

