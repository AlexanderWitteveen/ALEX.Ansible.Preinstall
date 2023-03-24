#!/bin/bash

ipaddress=$1
defaultusername=$2
username=$3
password=$4


expect -f ../scripts/add.user.expect "$ipaddress" "$defaultusername" "$username" "$password"
