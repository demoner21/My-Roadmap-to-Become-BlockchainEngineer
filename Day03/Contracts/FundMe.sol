// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.90;

contract FundMe {

    mapping(address => uint256) public addressFundedAmount;

    function fund() public payable {
        addressFundedAmount[msg.sender] += msg.value;
    }

}