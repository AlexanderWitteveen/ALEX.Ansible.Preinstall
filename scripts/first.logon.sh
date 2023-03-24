#!/bin/bash

ipaddress=$1
password=$2

installimage=$3

expect -f ../scripts/first.logon.$installimage.expect "$ipaddress" "$password"
