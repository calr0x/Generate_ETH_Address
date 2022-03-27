#!/bin/bash
N1=$'\n'

clear

if [[ ! -f keccak-256sum ]]; then
    curl -sL -O https://github.com/vkobel/ethereum-generate-wallet/raw/master/lib/x86-64/keccak-256sum
    chmod +x keccak-256sum
fi

if [[ -f eth_keys ]]; then
    rm eth_keys
fi

if [[ $1 -eq "" ]]; then
    TOTAL=1
else
    TOTAL=$1
fi

i=1

echo "Total Keys: $TOTAL" >> eth_keys
echo "Total Keys: $TOTAL"

while [[ $i -le $TOTAL ]]
do
    KEY=$(openssl ecparam -name secp256k1 -genkey -noout | openssl ec -text -noout 2>/dev/null)
    PUB=$(echo "$KEY" | grep pub -A 5 | tail -n +2 | tr -d '\n[:space:]:' | sed 's/^04//')
    PRIV=$(echo "$KEY" | grep priv -A 3 | tail -n +2 | tr -d '\n[:space:]:' | sed 's/^00//')
#    ADDRESS=$(echo "$PUB" | sha256sum | tr -d ' -' | tail -c 41)
    ADDRESS=$(echo "$PUB" | ./keccak-256sum -x -l | tr -d ' -' | tail -c 41)

    echo "${N1}${N1}Key $i:" >> eth_keys
    echo "${N1}${N1}Key $i:"

    echo "${N1}Public Key  = 0x$ADDRESS"
    echo "Public Key  = 0x$ADDRESS" >> /root/eth_keys
    echo "Private Key = $PRIV${N1}"
    echo "Private Key = $PRIV" >> /root/eth_keys
    ((i = i + 1))
done
