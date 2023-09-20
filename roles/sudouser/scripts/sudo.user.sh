#!/bin/bash

ipaddress=$1
username=$2
password=$3

expect -f $(dirname "$0")/sudo.user.expect "$ipaddress" "$username" "$password"
if [[ "$?" != "0" ]]; then 
    echo "**** Error: Expect failed"
fi
