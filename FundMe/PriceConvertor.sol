//SPDX-License-Identifier:MIT

pragma solidity^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConvertor {
    function getPrice() internal view returns (uint256) {
        // We need Address of the contract to fetch realtime price 
        // We need to fetch price from the contract
        // Contract Address :0x694AA1769357215DE4FAC081bf1f309aDC325306
        // We need to convert price to USD
        // We need to set the minimum amount to send
        // We need ABI Key
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,) = priceFeed.latestRoundData();
        // The Value will be in USD
        return uint256(answer * 1e10);

    }
   
    function priceConversion(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
        
    } 

    function getVersion() internal view returns (uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}