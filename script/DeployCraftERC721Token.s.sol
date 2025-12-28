// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {CraftERC721Token} from "../src/CraftERC721Token.sol";

contract DeployCraftERC721Token is Script {
    function run() external returns (CraftERC721Token) {
        vm.startBroadcast();
        CraftERC721Token craftToken = new CraftERC721Token();
        vm.stopBroadcast();
        return craftToken;
    }
}
