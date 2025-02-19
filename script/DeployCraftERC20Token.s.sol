//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {CraftERC20Token} from "../src/CraftERC20Token.sol";

contract DeployCraftERC20Token is Script {
    function run() external returns (CraftERC20Token) {
        vm.startBroadcast();
        CraftERC20Token craftERC20Token = new CraftERC20Token();
        vm.stopBroadcast();
        return craftERC20Token;
    }
}
