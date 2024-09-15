// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RVPToken is ERC20, Ownable {
    constructor() ERC20("RiverPets", "RVP") Ownable(msg.sender) {
        _mint(msg.sender, 100000 * 10 ** decimals());
    }

    function transferTokens(address recipient, uint256 amount) public returns (bool) {
        return transfer(recipient, amount);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
