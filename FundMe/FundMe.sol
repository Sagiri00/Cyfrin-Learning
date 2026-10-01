// Task
// Get Funds from user
// withdraw Funds
// Set a Minimum amount for user to spend

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

uint256 constant minimumUSD = 5;

interface AggregatorV3Interface {
  function decimals() external view returns (uint8);

  function description() external view returns (string memory);

  function version() external view returns (uint256);

  function getRoundData(
    uint80 _roundId
  ) external view returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);

  function latestRoundData()
    external
    view
    returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
}

// address constant _to = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
contract FundMe {
    function deposite() public payable {
        // Allow user to send money
        // Set a minimum amount to send
        // User have to send minimum amount as 5$
        // require(msg.value >= minimumUSD , "Need to send a minimum amount of 1 ETH");

    }

    function withdraw() public payable{
        // address payable _to = address(FundMe);
        // _to.transfer(msg.value);
    }

    function getPrice() public {
        // We need Address of the contract to fetch realtime price 
        // We need to fetch price from the contract
        // Contract Address :0x694AA1769357215DE4FAC081bf1f309aDC325306
        // We need to convert price to USD
        // We need to set the minimum amount to send
        // We need ABI Key

    }

    function getABI() public view returns (uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

    function priceConversion() public{} 

}