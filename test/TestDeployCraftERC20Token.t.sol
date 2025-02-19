//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Token} from "../src/Token.sol";
import {CraftERC20Token} from "../src/CraftERC20Token.sol";
import {Test, console} from "forge-std/Test.sol";
import {DeployCraftERC20Token} from "../script/DeployCraftERC20Token.s.sol";

contract TestDeployCraftERC20Token is Test {
    Token public token;
    CraftERC20Token public craftERC20Token;
    DeployCraftERC20Token public deployCraftERC20Token;

    uint256 constant INIT_SUPPLY = 10000 ether;
    string constant TOKEN_NAME = "Test Token";
    string constant TOKEN_SYMBOL = "TTT";

    function setUp() external {
        deployCraftERC20Token = new DeployCraftERC20Token();
        craftERC20Token = deployCraftERC20Token.run();
        token = craftERC20Token.mintERC20Token(INIT_SUPPLY, TOKEN_NAME, TOKEN_SYMBOL);
    }

    function testTokenInitDetails() external view {
        assertEq(token.totalSupply(), INIT_SUPPLY);
        assertEq(token.name(), TOKEN_NAME);
        assertEq(token.symbol(), TOKEN_SYMBOL);
    }

    function testBalanceOfOwner() external view {
        assertEq(token.balanceOf(address(this)), INIT_SUPPLY);
    }

    // function testlogging() external view {
    //     console.log("deployCraftERC20Token", address(deployCraftERC20Token));
    //     console.log("craftERC20Token", address(craftERC20Token));
    //     console.log("address(token)", address(token));
    //     console.log("address(this)", address(this));
    //     console.log("msg.sender", msg.sender);
    //     console.log("i_craftERC20Token_Owner", craftERC20Token.i_craftERC20Token_Owner());
    //     console.log("i_tokenOwner", token.i_tokenOwner());
    // }
}
