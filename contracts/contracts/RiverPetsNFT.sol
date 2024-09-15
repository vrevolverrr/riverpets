// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract RiverPetsNFT is ERC721URIStorage, Ownable {
    struct PetTraits {
        uint XP;
        uint Health;
        uint Happiness;
        uint RiverID;
    }

    mapping(uint256 => PetTraits) private _tokenTraits;

    constructor() ERC721("RiverPetsNFT", "RPN") Ownable(msg.sender) {}

    function mintNFT(address to, uint256 tokenId, uint initialXP, uint initialHealth, uint initialHappiness, uint riverID, string memory tokenURI) public onlyOwner {
        _mint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);

        _tokenTraits[tokenId] = PetTraits({
            XP: initialXP,
            Health: initialHealth,
            Happiness: initialHappiness,
            RiverID: riverID
        });
    }

    function transferNFT(address from, address to, uint256 tokenId) public {
        if (ownerOf(tokenId) == from) {
            safeTransferFrom(from, to, tokenId);
        }
    }

    function getTraits(uint256 tokenId) public view returns (uint256 XP, uint256 Health, uint256 Happiness, uint256 RiverID) {
        require(_ownerOf(tokenId) != address(0), "Token does not exist");
        PetTraits memory traits = _tokenTraits[tokenId];
        return (traits.XP, traits.Health, traits.Happiness, traits.RiverID);
    }

    function updateXP(uint256 tokenId, uint newXP) public onlyOwner {
        require(_ownerOf(tokenId) != address(0), "Token does not exist");
        _tokenTraits[tokenId].XP = newXP;
    }

    function updateHealth(uint256 tokenId, uint newHealth) public onlyOwner {
        require(_ownerOf(tokenId) != address(0), "Token does not exist");
        _tokenTraits[tokenId].Health = newHealth;
    }

    function updateHappiness(uint256 tokenId, uint newHappiness) public onlyOwner {
        require(_ownerOf(tokenId) != address(0), "Token does not exist");
        _tokenTraits[tokenId].Happiness = newHappiness;
    }
}
