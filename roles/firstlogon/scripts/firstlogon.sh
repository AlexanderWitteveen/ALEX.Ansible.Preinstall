#!/bin/bash

role_path="$1"
ipaddress="$2"
defaultusername="$3"
defaultpassword="$4"
password="$5"

expect -f $role_path/scripts/firstlogon.expect "$ipaddress" "$defaultusername" "$defaultpassword" "$password"
