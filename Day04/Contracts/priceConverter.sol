//Get funds from users
// Withdraw funds
// Set a minimun funding value in USD
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library priceConverter {

    function getPrice() internal view returns(uint256){
        // ABI
        // Address 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        AggregatorV3Interface priceNow = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
       (,int256 price,,,)= priceNow.latestRoundData();
        // Eth in terms of USD
        // 3000.00000000
       return uint256(price * 1e10); // 1**10 == 10000000000
    }

    function getVersion() public view returns(uint256) {
        AggregatorV3Interface priceNow = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceNow.version();
    }
    function convertPrice(uint256 ethAmount) internal view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethInUSD = (ethPrice * ethAmount) / 1e18;
        return ethInUSD;
    }
}