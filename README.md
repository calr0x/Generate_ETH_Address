# Generate_ETH_Address
Generates a valid Ethereum Keypair

To use:

```
git clone https://github.com/calr0x/Generate_ETH_Address.git
```
```
cd Generate_ETH_Address
```

This will generate 1 key and write it to /root/eth_keys:
```
./generate_key.sh
```

You can optionally specify the number of keys to generate by adding the number to the end. This command will create 100 keys:
```
./generate_key.sh 100
```