#!/bin/bash

ipaddress=$1
username=$2
password=$3
keypath=$4

pub=$(cat $keypath.pub)

expect -f ../scripts/auto.logon.expect "$ipaddress" "$username" "$password" "$pub" "$keypath"
