#!/bin/bash

get_ec2_tags () {
    name=$1
    aws ec2 describe-tags -
        -filter "Name=resource-id,Values=$INSTANCEID" | python -c 
            "import sys; import json; print(''.join(x['Value'] for x in json.load(sys.stdin)['Tags'] if x['Key'] == '$name'))"
}
