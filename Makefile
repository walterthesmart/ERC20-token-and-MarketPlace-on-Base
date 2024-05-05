-include .env

.PHONY: all test clean deploy fund help install snapshot format anvil 

DEFAULT_ANVIL_KEY := 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

help:
	@echo "Usage:"
	@echo "  make deploy [ARGS=...]\n    example: make deploy ARGS=\"--network sepolia\""
	@echo ""
	@echo "  make fund [ARGS=...]\n    example: make deploy ARGS=\"--network sepolia\""

all: clean remove install update build

# Clean the repo
clean  :; forge clean

# Remove modules
remove :; rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "modules"

install :; forge install Cyfrin/foundry-devops@0.0.11 --no-commit --no-commit && forge install foundry-rs/forge-std@v1.5.3 --no-commit && forge install openzeppelin/openzeppelin-contracts@v4.8.3 --no-commit

# Update Dependencies
update :; forge update

build :; forge build

test :; forge test 

snapshot :; forge snapshot

format :; forge fmt

anvil :; anvil -m 'test test test test test test test test test test test junk' --steps-tracing --block-time 1

NETWORK_ARGS := --rpc-url http://localhost:8545 --private-key $(DEFAULT_ANVIL_KEY) --broadcast

ifeq ($(findstring --network sepolia,$(ARGS)),--network sepolia)
	NETWORK_ARGS := --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv
else ifeq ($(findstring --network berachain,$(ARGS)),--network berachain)
	NETWORK_ARGS := --rpc-url $(BERACHAIN_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast -vvvv
else ifeq ($(findstring --network taiko,$(ARGS)),--network taiko)
	NETWORK_ARGS := --rpc-url $(TAIKO_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast -vvvv
else ifeq ($(findstring --network bnb,$(ARGS)),--network bnb)
	NETWORK_ARGS := --rpc-url $(BNB_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast -vvvv
else ifeq ($(findstring --network base,$(ARGS)),--network base)
	NETWORK_ARGS := --rpc-url $(BASE_SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast -vvvv
endif


deploy:
	@forge script script/MarketPlace.s.sol:MarketScript $(NETWORK_ARGS)

# cast abi-encode "constructor(uint256)" 1000000000000000000000000 -> 0x00000000000000000000000000000000000000000000d3c21bcecceda1000000
# Update with your contract address, constructor arguments and anything else
verify:
	@forge verify-contract --chain-id 84532 --num-of-optimizations 200 --watch --compiler-version 0.8.18 --etherscan-api-key $(BASESCAN_API_KEY) 0x4E9025aA19254B2EA663798931Ec1c15226846C3 src/deployOnTestnet.sol:BasicMath
mint:
	@forge script script/Interactions.s.sol:MintVBERA $(NETWORK_ARGS)

interact:
	forge script script/InteractWithStuff.s.sol:InteractWithStuff --broadcast --rpc-url http://localhost:8545  --private-key $(DEFAULT_ANVIL_KEY)   -vvvv 
