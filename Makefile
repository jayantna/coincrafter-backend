-include .env

.PHONY: all


deploy:; forge script DeployToken 100 TestToken TT --sig "run(uint256,string,string)" --account myKeystore --sender $(PUBLIC_KEY) --rpc-url $(ANVIL_RPC_URL) --broadcast

verify_contract:; forge verify-contract $(contract) --verifier etherscan --api-key $(api) --rpc-url $(rpc)

#Cast direct interaction with blockchain
generate_keys:; cast wallet new

fund_account:; cast send $(PUBLIC_KEY) --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --value 1000000000000000000 --rpc-url $(ANVIL_RPC_URL)

check_balance:; cast balance $(PUBLIC_KEY) --rpc-url $(ANVIL_RPC_URL)

query_blockchain:; cast call 0x9fd9FF4d870e5051469b9ED61Ee4980198B8C9f2 "balanceOf(address)" $(PUBLIC_KEY) --rpc-url $(ANVIL_RPC_URL) | cast --to-dec

send_blockchain:; cast send 0x83e71902D4c28e34c669682eB2188254B58CB6E7 "mintERC20Token(uint256,string,string)" 100 Solana SOL --rpc-url $ANVIL_RPC_URL --account myKeystore      

hex-to-dec:; cast --to-dec $(VALUE)

abi_decode:; cast --abi-decode "$(sig)" $(data)
#cast --abi-decode "getTokensMintedByAddress()(address[])" 0x00000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000002000000000000000000000000f22641d4dfd02ee4129cd9ac916f0253e1b0fbb8000000000000000000000000061bd5764e3099d3df8e3e12535f0b0d5a6f9c63

abi_encode:; cast--abi-encode "$(sig)" $(data)