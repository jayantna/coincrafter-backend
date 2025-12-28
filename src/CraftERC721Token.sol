//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {NFT} from "./NFT.sol";

/**
 * @title CraftERC721Token
 * @dev Contract to mint an ERC721 token.
 * @author Jayant Nagle
 */

contract CraftERC721Token {
    /**
     * @dev Event to keep track of the token crafted by the deployer.
     * @param tokenDeployer The address of the deployer of the token.
     * @param tokenContract The address of the token contract.
     */
    event TokenCrafted(address indexed tokenDeployer, address tokenContract);

    /**
     * @dev Mapping to keep track of all tokens minted by an address.
     */

    mapping(address => address[]) private tokenOwnerToContracts;
    mapping(address => bool) private isTokenOwner;
    address[] private tokenOwners;

    /**
     * @dev Function to mint an ERC721 token.
     */
    function mintERC721Token(
        string memory tokenName,
        string memory tokenSymbol
    ) public returns (NFT) {
        NFT token = new NFT(msg.sender, tokenName, tokenSymbol);
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

    function getTokensMintedByAddress(
        address addr
    ) public view returns (address[] memory) {
        return tokenOwnerToContracts[addr];
    }

    function getTokenOwners(uint256 index) public view returns (address) {
        return tokenOwners[index];
    }

    function getTokenOwnersLength() public view returns (uint256) {
        return tokenOwners.length;
    }
}
