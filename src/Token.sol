//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    constructor(address owner, uint256 initialSupply, string memory tokenName, string memory tokenSymbol)
        ERC20(tokenName, tokenSymbol)
    {
        _mint(owner, initialSupply);
    }
}
