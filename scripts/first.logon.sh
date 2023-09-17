#!/bin/bash

ipaddress=$1
password=$2
expect=$3
installusername=$4
installpassword=$5

expect -f ../scripts/first.logon.$expect.expect "$ipaddress" "$password" "$installusername" "$installpassword"
if [[ "$?" != "0" ]]; then 
    echo "**** Error: Expect failed"
fi
