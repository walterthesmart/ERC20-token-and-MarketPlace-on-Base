export const contractAddress = '0xbA7F9A0f11AD335aD876228044575eA1B3A2721B'
export const abi = [
    {
        "inputs": [],
        "stateMutability": "nonpayable",
        "type": "constructor"
    },
    {
        "inputs": [],
        "type": "error",
        "name": "MarketPlace_InsuffiecientFunds"
    },
    {
        "inputs": [],
        "type": "error",
        "name": "MarketPlace_InvalidId"
    },
    {
        "inputs": [],
        "type": "error",
        "name": "MarketPlace_InvalidName"
    },
    {
        "inputs": [],
        "type": "error",
        "name": "MarketPlace_InvalidPrice"
    },
    {
        "inputs": [],
        "type": "error",
        "name": "MarketPlace_ProductSold"
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "id",
                "type": "uint256",
                "indexed": false
            },
            {
                "internalType": "string",
                "name": "name",
                "type": "string",
                "indexed": false
            },
            {
                "internalType": "uint256",
                "name": "price",
                "type": "uint256",
                "indexed": false
            },
            {
                "internalType": "address payable",
                "name": "owner",
                "type": "address",
                "indexed": false
            },
            {
                "internalType": "bool",
                "name": "purchased",
                "type": "bool",
                "indexed": false
            }
        ],
        "type": "event",
        "name": "ProductCreated",
        "anonymous": false
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "id",
                "type": "uint256",
                "indexed": false
            },
            {
                "internalType": "string",
                "name": "name",
                "type": "string",
                "indexed": false
            },
            {
                "internalType": "uint256",
                "name": "price",
                "type": "uint256",
                "indexed": false
            },
            {
                "internalType": "address payable",
                "name": "owner",
                "type": "address",
                "indexed": false
            },
            {
                "internalType": "bool",
                "name": "purchased",
                "type": "bool",
                "indexed": false
            }
        ],
        "type": "event",
        "name": "ProductPurchased",
        "anonymous": false
    },
    {
        "inputs": [
            {
                "internalType": "string",
                "name": "_name",
                "type": "string"
            },
            {
                "internalType": "uint256",
                "name": "_price",
                "type": "uint256"
            }
        ],
        "stateMutability": "nonpayable",
        "type": "function",
        "name": "createProduct"
    },
    {
        "inputs": [],
        "stateMutability": "view",
        "type": "function",
        "name": "deployer",
        "outputs": [
            {
                "internalType": "string",
                "name": "",
                "type": "string"
            }
        ]
    },
    {
        "inputs": [],
        "stateMutability": "view",
        "type": "function",
        "name": "name",
        "outputs": [
            {
                "internalType": "string",
                "name": "",
                "type": "string"
            }
        ]
    },
    {
        "inputs": [],
        "stateMutability": "view",
        "type": "function",
        "name": "productCount",
        "outputs": [
            {
                "internalType": "uint256",
                "name": "",
                "type": "uint256"
            }
        ]
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "",
                "type": "uint256"
            }
        ],
        "stateMutability": "view",
        "type": "function",
        "name": "products",
        "outputs": [
            {
                "internalType": "uint256",
                "name": "id",
                "type": "uint256"
            },
            {
                "internalType": "string",
                "name": "name",
                "type": "string"
            },
            {
                "internalType": "uint256",
                "name": "price",
                "type": "uint256"
            },
            {
                "internalType": "address payable",
                "name": "owner",
                "type": "address"
            },
            {
                "internalType": "bool",
                "name": "purchased",
                "type": "bool"
            }
        ]
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "_id",
                "type": "uint256"
            }
        ],
        "stateMutability": "payable",
        "type": "function",
        "name": "purchaseProduct"
    }
]