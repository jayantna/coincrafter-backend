-include .env

.PHONY: all


deploy:; forge script DeployToken 100 TestToken TT --sig "run(uint256,string,string)" --account myKeystore --sender $(PUBLIC_KEY) --rpc-url $(ANVIL_RPC_URL) --broadcast

#Cast direct interaction with blockchain
fund_account:; cast send $(PUBLIC_KEY) --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --value 1000000000000000000 --rpc-url $(ANVIL_RPC_URL)

check_balance:; cast balance $(PUBLIC_KEY) --rpc-url $(ANVIL_RPC_URL)

query_blockchain:; cast call 0x9fd9FF4d870e5051469b9ED61Ee4980198B8C9f2 "balanceOf(address)" $(PUBLIC_KEY) --rpc-url $(ANVIL_RPC_URL) | cast --to-dec

hex-to-dec:; cast --to-dec $(VALUE)