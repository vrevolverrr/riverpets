// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract RVPTrade {
    constructor() {}

    function transferBoth(
        address erc20ContractAddress,
        address erc721ContractAddress,
        address tokenRecipient,
        address nftRecipient,            
        uint256 erc20Amount,             
        uint256 nftTokenId
    ) public {
        console.log("erc20ContractAddress", erc20ContractAddress);
        // Transfer ERC20 tokens
        IERC20 erc20 = IERC20(erc20ContractAddress);
        erc20.transferFrom(nftRecipient, tokenRecipient, erc20Amount);

        // Transfer ERC721 NFT
        IERC721 erc721 = IERC721(erc721ContractAddress);
        erc721.safeTransferFrom(tokenRecipient, nftRecipient, nftTokenId);
    }
}
