//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {DeployToken} from "../script/DeployToken.s.sol";
import {Token} from "../src/Token.sol";
import {Test, console} from "forge-std/Test.sol";

contract TestDeployToken is Test {
    Token public token;
    uint256 constant INIT_SUPPLY = 100 ether;

    function setUp() public {
        DeployToken deployer = new DeployToken();
        token = deployer.run(INIT_SUPPLY, "TestToken", "TT");
    }

    function testTokenSupply() public view {
        assertEq(token.totalSupply(), INIT_SUPPLY);
    }

    function testBalanceOfOwner() public view {
        assertEq(token.balanceOf(msg.sender), INIT_SUPPLY);
    }
}
