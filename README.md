#  Generate_ETH_Private_Key

Generates a valid Ethereum privatekey for use with Metamask

WARNING: Metamask will create a public key based on the generated private key. Use the private key and import into Metamask. Use the generated public address Metamask provides.

To use:

```
git clone https://github.com/calr0x/Generate_ETH_Private_Key.git
```
```
cd Generate_ETH_Private_Key
```

This will generate 1 key and write it to /root/eth_keys:
```
./generate_key.sh
```

You can optionally specify the number of keys to generate by adding the number to the end. This command will create 100 keys:
```
./generate_key.sh 100
```
