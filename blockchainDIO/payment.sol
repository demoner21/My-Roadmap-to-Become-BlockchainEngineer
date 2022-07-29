// SPDX-License-Identifier: MIT

pragma solidity >=0.4.2 <0.9.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract paymentCertificade {

    uint256 public minimumUsd = 57 * 1e18; // calculate the minimun of ETH to send, remember to make 1e18, because the wei, gwei, eth covertion

    address[] public funders;
    mapping(address => uint256) public addressToAMountFunded;

    function fund() public payable {
        // want to be able to set a minimun fund amount in usd
        require(convertPrice(msg.value) >= minimumUsd, "Didn't send enough, please check the balance");
        funders.push(msg.sender);
        addressToAMountFunded[msg.sender] = msg.value;
    }

    function getPrice() public view returns(uint256){
        // Address 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e => this address is from rinkeby test network to convert USD/ETH
        AggregatorV3Interface priceNow = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e); // we get the address in chainlink feed date
       (,int256 price,,,)= priceNow.latestRoundData(); // use the interface of the chainlink to get a realtime price of the events
        // 3000.00000000
       return uint256(price * 1e10); // 1**10 == 10000000000
    }

    function getVersion() public view returns(uint256) {
        AggregatorV3Interface priceNow = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e); // version of the interface
        return priceNow.version();
    }

    //convert price of the ETH / USD
    function convertPrice(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethInUSD = (ethPrice * ethAmount) / 1e18;
        return ethInUSD;
    }

}