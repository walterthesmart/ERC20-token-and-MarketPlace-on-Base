//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @title MarketPlace Smart contract deployed on Base
 * @author Nwaugo Walter
 * @notice Will be deployed on the Base Sepolia testnet
 */

contract MarketPlace {
    error MarketPlace_InvalidName();
    error MarketPlace_InvalidPrice();
    error MarketPlace_InvalidId();
    error MarketPlace_InsuffiecientFunds();
    error MarketPlace_ProductSold();

    string public name;
    string public deployer;
    uint public productCount = 0;
    mapping(uint => Product) public products;

    struct Product {
        uint id;
        string name;
        uint price;
        address payable owner;
        bool purchased;
    }

     event ProductCreated (
        uint id,
        string name,
        uint price,
        address payable owner,
        bool purchased
    );

     event ProductPurchased (
        uint id,
        string name,
        uint price,
        address payable owner,
        bool purchased
    );

    constructor() {
        name = "MarktPlace Smart Contract on Sepolia Testnet";
        deployer = "Nwaugo Walter";
    }

    function createProduct(string memory _name, uint _price) public {
        // Require a valid name
        if (bytes(_name).length <= 0){
            revert MarketPlace_InvalidName();
        }
        // Require a valid price
        if (_price <= 0){
            revert MarketPlace_InvalidPrice();
        }
        // Increment product count
        productCount ++;
        // Create the product
        address payable owner = payable(msg.sender);
        products[productCount] = Product(productCount, _name, _price, owner, false);
        // Trigger an event
        emit ProductCreated(productCount, _name, _price, payable(msg.sender), false);
    }

    function purchaseProduct(uint _id) public payable {
        // Fetch the product
        Product memory _product = products[_id];
        // Fetch the owner
        address payable _seller = _product.owner;
        // Make sure the product has a valid id
        if (_product.id < 1 || _product.id < productCount){
            revert MarketPlace_InvalidId();
        }
        // Require that there is enough Ether in the transaction
        if (msg.value < _product.price){
            revert MarketPlace_InsuffiecientFunds();
        }
        // Require that the product has not been purchased already
        if (_product.purchased == true) {
            revert MarketPlace_ProductSold();
        }
        // Require that the buyer is not the seller
        require(_seller != msg.sender);
        // Transfer ownership to the buyer
        _product.owner = payable(msg.sender);
        // Mark as purchased
        _product.purchased = true;
        // Update the product
        products[_id] = _product;
        // Pay the seller by sending them Ether
        _seller.transfer(msg.value);
        // Trigger an event
        emit ProductPurchased(productCount, _product.name, _product.price, payable(msg.sender), true);
    }
}