// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {MarketPlace} from "../src/MarketPlace.sol";

contract MarketScript is Script {
    function setUp() public {}

    function run() external { 
        // uint privateKey = vm.envUnint("PRIVATE_KEY");\
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address account = vm.addr(deployerPrivateKey);
        // address secondAccount = 0x611419E8768E45d1e25A6B7d3A51403e9BEfC599;
        console.log("Account: ", account);

        vm.startBroadcast(deployerPrivateKey);
        MarketPlace marketplace = new MarketPlace();
        console.log("contract deployed");
        // create product
        marketplace.createProduct("Laptop", 1000 ether);
        marketplace.createProduct("Phone", 500 ether);
        console.log("Product Created");
        
        //transfer
        // zubbyToken.transfer(account, secondAccount, 50);
        // console.log("transfer done");
        vm.stopBroadcast();

        // return zubbyToken;
    }
}