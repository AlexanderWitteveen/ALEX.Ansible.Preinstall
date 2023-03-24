#!/bin/bash

ipaddress=$1
defaultusername=$2
password=$3

installimage=$4

expect -f ../scripts/remote.install.sudo.$installimage.expect "$ipaddress" "$defaultusername" "$password"
