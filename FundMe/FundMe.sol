// Task
// Get Funds from user
// withdraw Funds
// Set a Minimum amount for user to spend

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {PriceConvertor} from "./PriceConvertor.sol";

uint256 constant minimumUSD = 5e18;


// address constant _to = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
contract FundMe {

using PriceConvertor for uint256;

address[] public funders;
mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

address public owner;

constructor() {
    owner = msg.sender;
}

    function deposite() public payable {

        // Allow user to send money
        // Set a minimum amount to send
        // User have to send minimum amount as 5$
        require(msg.value.priceConversion() >= minimumUSD , "Need to send a minimum amount of 1 ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public payable{
        
        require(msg.sender == owner, "Only owner can withdraw");

        for(uint256 funderIndex = 0; funderIndex > funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);
        
        (bool success,) = payable(msg.sender).call{value: address(this).balance}("");
        require(success, "Failed to send ETH");

    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Only owner can call this function");
        _;
    }

    // What if someone sends funds without calling the function itself.
    // There are Two Special functions in solidity for this situation which are
     // 1. receive() - 2. fallback() - These are special functions which are called when someone sends funds to the contract without calling any function.
     // receive() function is called when someone sends funds to the contract without calling any function and the function is payable.
     // fallback() function is called when someone sends funds to the contract without calling any function and the function is not payable.
     // fallback() function is also called when someone calls a function which does not exist

     receive () external payable {
        deposite();
     }

     fallback() external payable {
        deposite();
      }
}