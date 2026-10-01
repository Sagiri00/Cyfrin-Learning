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


    function deposite() public payable {

        // Allow user to send money
        // Set a minimum amount to send
        // User have to send minimum amount as 5$
        require(msg.value.priceConversion() >= minimumUSD , "Need to send a minimum amount of 1 ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    function withdraw() public payable{
        // address payable _to = address(FundMe);
        // _to.transfer(msg.value);
    }


}