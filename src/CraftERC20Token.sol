//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Token} from "./Token.sol";

contract CraftERC20Token {
    event TokenCrafted(address indexed tokenDeployer, address tokenContract);

    mapping(address => address[]) private tokenOwnerToContracts;
    mapping(address => bool) private isTokenOwner;
    address[] private tokenOwners;

    function mintERC20Token(uint256 initialSupply, string memory tokenName, string memory tokenSymbol)
        public
        returns (Token)
    {
        Token token = new Token(msg.sender, initialSupply, tokenName, tokenSymbol);
        //Mapping to keep track of all tokens minted by an address
        tokenOwnerToContracts[msg.sender].push(address(token));

        //Array to keep track of all token owners and check if the address is unique
        if (!isTokenOwner[msg.sender]) {
            tokenOwners.push(msg.sender);
            isTokenOwner[msg.sender] = true;
        }

        emit TokenCrafted(msg.sender, address(token));
        return token;
    }

    function getTokensMintedByAddress(address addr) public view returns (address[] memory) {
        return tokenOwnerToContracts[addr];
    }

    function getTokenOwners(uint256 index) public view returns (address) {
        return tokenOwners[index];
    }

    function getTokenOwnersLength() public view returns (uint256) {
        return tokenOwners.length;
    }
}
