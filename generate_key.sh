#!/bin/bash
N1=$'\n'

KEY=$(openssl ecparam -name secp256k1 -genkey -noout | openssl ec -text -noout)

PUB=$(echo "$KEY" | grep pub -A 5 | tail -n +2 | tr -d '\n[:space:]:' | sed 's/^04//')

PRIV=$(echo "$KEY" | grep priv -A 3 | tail -n +2 | tr -d '\n[:space:]:' | sed 's/^00//')

ADDRESS=$(echo "$PUB" | sha256sum | tr -d ' -' | tail -c 41)

clear

if [[ -f /root/eth_keys ]]; then
    rm /root/eth_keys
fi

if [[ $1 -eq "" ]]; then
    TOTAL=1
else
    TOTAL=$1
fi

i=1

while [[ $i -le $TOTAL ]]
do
    echo "Key $i:${N1}"
    echo "${N1}Public Key  = 0x$ADDRESS"
    echo "${N1}Public Key  = 0x$ADDRESS" >> /root/eth_keys
    echo "Private Key = $PRIV${N1}"
    echo "Private Key = $PRIV${N1}" >> /root/eth_keys
    ((i = i + 1))
done