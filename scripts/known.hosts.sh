#!/bin/bash

ipaddress=$1
localuserssh=$2

keystring=$(ssh-keyscan -H -t ecdsa $ipaddress 2>/dev/null)
echo $keystring
if [[ -z $keystring ]]; then
  echo "Error: Server not online"
  exit 2
fi

IFS=' ' read -ra keyarray <<< $keystring 
createkey=false

if ssh-keygen -F "$ipaddress" -f "$localuserssh/known_hosts" -l | grep "found" > /dev/null ; then
    echo "host exists"

    if cat "$localuserssh/known_hosts" | grep ${keyarray[2]} > /dev/null; then
        echo "good key exists"
    else
        echo "remove key exists"
        ssh-keygen -f "$localuserssh/known_hosts" -R "$ipaddress"
        createkey=true
    fi
else
    echo "key does not exist"
    createkey=true
fi

if $createkey; then
    echo "Changed: Create key"
    echo $keystring >> "$localuserssh/known_hosts"
    exit 1
else
    exit 0
fi
