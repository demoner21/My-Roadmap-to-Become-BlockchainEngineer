// SPDX-License-Identifier: MIT

pragma solidity >=0.4.2 <0.9.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUsd = 57 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAMountFunded;

    function fund() public payable {
        // want to be able to set a minimun fund amount in usd
        require(getConversionRate(msg.value) >= minimumUsd, "Didn't send enough, please check the balance");
        funders.push(msg.sender);
        addressToAMountFunded[msg.sender] = msg.value;
    }

    function getPrice() public view returns(uint256){
        // ABI
        // Address 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
       (,int256 price,,,)= priceFeed.latestRoundData();
        // Eth in terms of USD
        // 3000.00000000
       return uint256(price * 1e10); // 1**10 == 10000000000
    }

    function getVersion() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }
    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUSD = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUSD;
    }

    // function withDraw(){}

}