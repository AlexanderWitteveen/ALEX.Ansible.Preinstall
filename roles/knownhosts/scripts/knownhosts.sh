#!/bin/bash

role_path="$1"
ipaddress="$2"
knownhostsfilepath="$HOME/.ssh/known_hosts"

keystring=$(ssh-keyscan -H -t ecdsa $ipaddress 2>/dev/null)
if [[ -z $keystring ]]; then
    keystring=$(ssh-keyscan -H -t ed25519 $ipaddress 2>/dev/null)
    if [[ -z $keystring ]]; then
        keystring=$(ssh-keyscan -H -t rsa $ipaddress 2>/dev/null)
        if [[ -z $keystring ]]; then
            echo "Error: Server not online"
            exit 2
        fi
    fi
fi

IFS=' ' read -ra keyarray <<< $keystring 
createkey=false

if ssh-keygen -F "$ipaddress" -f "$knownhostsfilepath" -l | grep "found" > /dev/null ; then
    echo "host exists"

    if cat "$knownhostsfilepath" | grep ${keyarray[2]} > /dev/null; then
        echo "good key exists"
    else
        echo "remove key exists"
        ssh-keygen -f "$knownhostsfilepath" -R "$ipaddress"
        createkey=true
    fi
else
    echo "key does not exist"
    createkey=true
fi

if $createkey; then
    echo "Changed: Create key"
    echo $keystring >> "$knownhostsfilepath"
    exit 1
else
    exit 0
fi
