#!/bin/bash

ipaddress=$1
defaultusername=$2
username=$3
password=$4


expect -f $(dirname "$0")/add.user.expect "$ipaddress" "$defaultusername" "$username" "$password"
if [[ "$?" != "0" ]]; then 
    echo "**** Error: Expect failed"
fi
