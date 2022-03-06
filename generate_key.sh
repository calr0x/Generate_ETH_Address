#!/bin/bash
N1=$'\n'

KEY=$(openssl ecparam -name secp256k1 -genkey -noout | openssl ec -text -noout)

PUB=$(echo "$KEY" | grep pub -A 5 | tail -n +2 | tr -d '\n[:space:]:' | sed 's/^04//')

PRIV=$(echo "$KEY" | grep priv -A 3 | tail -n +2 | tr -d '\n[:space:]:' | sed 's/^00//')

ADDRESS=$(echo "$PUB" | sha256sum | tr -d ' -' | tail -c 41)

clear

if [[ $1 -eq "" ]]; then
    i=1
fi

for i in {1..$1};
do
    echo "${N1}Public Key  = 0x$ADDRESS"
    echo "Private Key = $PRIV${N1}"
    i=$((i-1))
done
