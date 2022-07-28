// SPDX-License-Identifier: MIT

pragma solidity >=0.4.2 <0.9.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUsd = 13;

    function fund() public payable {
        // want to be able to set a minimun fund amount in usd
        require(msg.value >= minimumUsd, "Didn't send enough, please check the balance");
    }

    function getPrice() public {
        // ABI
        // Address 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
    }

    function getVersion() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }

    // function withDraw(){}

}