#!/bin/bash

ipaddress=$1
username=$2

expect -f ../scripts/remote.install.python3.expect "$ipaddress" "$username"
if [[ "$?" != "0" ]]; then 
    echo "**** Error: Expect failed"
fi


#if [ $(dpkg -s "python3" &> /dev/null; echo $?) = 1 ] ; then apt install python3 -y; fi
#ln -s -f "/usr/bin/python3.8" "/usr/bin/python"


