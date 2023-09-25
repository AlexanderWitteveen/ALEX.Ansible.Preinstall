#!/bin/bash

ipaddress=$1
localuserssh=$2

keystring=$(ssh-keyscan -H -t ecdsa $ipaddress 2>/dev/null)
echo $keystring
if [[ -z $keystring ]]; then
  echo "Error: Server not online"
  exit 2
fi

ssh-keygen -R $ipaddress -f "$localuserssh/known_hosts"

echo $keystring >> "$localuserssh/known_hosts"
