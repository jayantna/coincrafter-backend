//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Token} from "../src/Token.sol";
import {Script} from "forge-std/Script.sol";

contract DeployToken is Script {
    function run(uint256 initialSupply, string memory tokenName, string memory tokenSymbol) external returns (Token) {
        vm.startBroadcast();
        Token token = new Token(initialSupply, tokenName, tokenSymbol);
        vm.stopBroadcast();
        return token;
    }
}
