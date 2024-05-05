## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```



### Taiko
```
forge verify-contract 0x526317252e346978869d178081dA2cd10ac8b56D src Counter.sol:Counter --verifier-url https://blockscoutapi.katla.taiko.xyz/api\? --verifier blockscout
```

### Berachain

```
forge script script/BingBongToken.s.sol --rpc-url https://artio.rpc.berachain.com/ --broadcast;
```


# FROM ./create-erc20-contract-using-foundry
```
forge verify-contract 0xYOUR_DEPLOYED_CONTRACT_ADDRESS BingBongToken --etherscan-api-key=xxxx --watch --constructor-args $(cast abi-encode "constructor(string,string,uint256)" "BingBongToken" "BBT" 5678) --retries=2 --verifier-url=https://api.routescan.io/v2/network/testnet/evm/80085/etherscan/api/
```
```
	# @forge verify-contract @0x21a6455008644C3092eDc25A8463a953A322c51a src/Taik.sol:TAIK --verifier-url https://blockscoutapi.katla.taiko.xyz/api\? --verifier blockscout
```