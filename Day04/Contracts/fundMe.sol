// SPDX-License-Identifier: MIT

pragma solidity >=0.4.2 <0.9.0;

import "./priceConverter.sol";

contract FundMe {
    using priceConverter for uint256;

    uint256 public minimumUsd = 57 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAMountFunded;

    function fund() public payable {
        // want to be able to set a minimun fund amount in usd
        require(msg.value.convertPrice() >= minimumUsd, "Didn't send enough, please check the balance");
        funders.push(msg.sender);
        addressToAMountFunded[msg.sender] = msg.value;
    }

    function withdraw() public {}

}