//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    /**
     * @dev Constructor that gives msg.sender all of existing tokens.
     * @author Jayant Nagle
     * @param owner The address of the owner of the token.
     * @param initialSupply The initial supply of the token.
     * @param tokenName The name of the token.
     * @param tokenSymbol The symbol of the token.
     * @notice The token will be created with the given initial supply and the owner address will be the owner of the token.
     * @notice The token will be created from another deployer contract
     */
    constructor(address owner, uint256 initialSupply, string memory tokenName, string memory tokenSymbol)
        ERC20(tokenName, tokenSymbol)
    {
        _mint(owner, initialSupply);
    }
}
