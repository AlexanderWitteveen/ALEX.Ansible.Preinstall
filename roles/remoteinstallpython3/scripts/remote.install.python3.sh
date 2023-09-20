#!/bin/bash

ipaddress=$1
username=$2

expect -f $(dirname "$0")/remote.install.python3.expect "$ipaddress" "$username"
if [[ "$?" != "0" ]]; then 
    echo "**** Error: Expect failed"
fi
