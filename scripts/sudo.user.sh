#!/bin/bash

ipaddress=$1
username=$2
password=$3

expect -f ../scripts/sudo.user.expect "$ipaddress" "$username" "$password"
if [[ "$?" != "0" ]]; then 
    echo "**** Error: Expect failed"
fi
