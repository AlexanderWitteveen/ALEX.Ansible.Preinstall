#!/bin/bash

ipaddress=$1
defaultusername=$2
password=$3
expect=$4

expect -f ../scripts/remote.install.sudo.$expect.expect "$ipaddress" "$defaultusername" "$password"
if [[ "$?" != "0" ]]; then 
    echo "**** Error: Expect failed"
fi
