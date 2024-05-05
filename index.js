import { ethers } from './ethers-5.1.esm.min.js';
import {contractAddress, abi} from './constant.js';

const connectButton = document.getElementById('connectButton');
const balanceButton = document.getElementById('balanceButton');
const createButton = document.getElementById('createProduct');
const purchaseButton = document.getElementById('purchaseProduct');

connectButton.onclick = connect;
balanceButton.onclick = getBalance;
createButton.onclick = createProduct;
purchaseButton.onclick = purchaseProduct;


// Initialization (Connect to Blockchain)
const provider = new ethers.providers.Web3Provider(window.ethereum);  
const signer = provider.getSigner();
const contractaddress = contractAddress;
const contractABI = abi;
const marketPlaceContract = new ethers.Contract(contractaddress, contractABI, signer);


async function connect(){
    if (typeof window.ethereum !== 'undefined') {
        try{
            await window.ethereum.request({ method: 'eth_requestAccounts' });
        } catch (error) {
            console.error(error);
        }
        connectButton.innerHTML = 'CONNECTED';
        const accounts = await window.ethereum.request({ method: 'eth_accounts' });
        console.log(accounts);
    }
}

async function getBalance(){
    if (typeof window.ethereum !== 'undefined') {
            const provider = new ethers.providers.Web3Provider(window.ethereum);
            const signer = provider.getSigner()
            const balance = await provider.getBalance(signer.getAddress());
            const weiValue = ethers.utils.formatEther(balance);
            console.log(weiValue);
    }
}

// Create Product Function
async function createProduct() {
    const productName = document.getElementById('productName').value;
    const productPrice = document.getElementById('productPrice').value;

    // Convert product price to Wei (smallest denomination of ETH) using ethers.js utils
    const priceInWei = ethers.utils.parseEther(productPrice);

    try {
        const tx = await marketPlaceContract.createProduct(productName, priceInWei);
        await tx.wait(1); // Wait for transaction confirmation 
        console.log('Product Created', tx);
    } catch (error) {
        console.error('Error creating product:', error);
    }
}

// Purchase Product
async function purchaseProduct() {
    const productId = document.getElementById('productId').value;
    const Price = document.getElementById('productPrice').value;
    // Convert product price to Wei (smallest denomination of ETH) using ethers.js utils
    const  priceInWei = ethers.utils.parseEther(Price);

    try {
        const tx = await marketPlaceContract.purchaseProduct(productId, { value: priceInWei }); // Value = Product Price
        await tx.wait(1);
        console.log('Product Purchased', tx);
    } catch (error) {
        console.error('Error purchasing product:', error);
    }
}








// You'll also need functions to fetch and display product listings with updates

