#!/bin/bash
N1=$'\n'

rm key pub priv address

KEY=$(openssl ecparam -name secp256k1 -genkey -noout | openssl ec -text -noout)

echo "${N1}$KEY" > key

PUB=$(cat key | grep pub -A 5 | tail -n +2 | tr -d '\n[:space:]:' | sed 's/^04//')

echo "$PUB" > pub

PRIV=$(cat key | grep priv -A 3 | tail -n +2 | tr -d '\n[:space:]:' | sed 's/^00//')

echo "$PRIV" > priv

ADDRESS=$(cat pub | keccak-256sum -x -l | tr -d ' -' | tail -c 41)

echo "$ADDRESS" > address

clear
echo "${N1}Public Key  = 0x$ADDRESS"
echo "Private Key = $PRIV${N1}"
