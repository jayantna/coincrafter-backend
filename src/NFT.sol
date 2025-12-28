//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {
    ERC721
} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {
    ERC721URIStorage
} from "../lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {
    ERC721Burnable
} from "../lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import {
    Ownable
} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract NFT is ERC721, ERC721URIStorage, ERC721Burnable, Ownable {
    constructor(
        address initialOwner,
        string memory name,
        string memory symbol
    ) ERC721(name, symbol) Ownable(initialOwner) {}

    function safeMint(
        address to,
        uint256 tokenId,
        string memory uri
    ) public onlyOwner {
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    function tokenURI(
        uint256 tokenId
    ) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(
        bytes4 interfaceId
    ) public view override(ERC721, ERC721URIStorage) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
