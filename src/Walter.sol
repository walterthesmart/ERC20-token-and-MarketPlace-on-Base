//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Pausable} from "@openzeppelin/contracts/utils/Pausable.sol";

contract WALTER is ERC20, Pausable, Ownable {
    // uint256 public constant INITIAL_SUPPLY = 1000 * 1 ether;
    uint256 public constant BURN_RATE = 10; // 10%
    address public constant BURN_ADDRESS = 0x611419E8768E45d1e25A6B7d3A51403e9BEfC599;
    constructor() ERC20("Walter on Base", "WALT") Ownable(msg.sender){
        _mint(msg.sender, 10000 * 10 ** decimals());
    }

    // @dev mint new tokens after deployemt
    function mint(address account, uint256 amount) external {
        _mint(account, amount);
    }

    // @dev 

    function _transfer(address sender, address recipient, uint256 amount) internal virtual override { 
        uint256 burnAmount = (amount * BURN_RATE) / 100;
        uint256 sendAmount = amount - burnAmount;
        super._transfer(sender, recipient, sendAmount);
        super._transfer(sender, BURN_ADDRESS, burnAmount);
    }
}