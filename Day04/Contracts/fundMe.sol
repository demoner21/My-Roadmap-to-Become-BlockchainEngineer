// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./priceConverter.sol";

//error nowOwner();

contract FundMe {
    using priceConverter for uint256;

    uint256 public constant minimumUsd = 57 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAMountFunded;

    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender; // sender of a msg is us
                            //one that deploys the smartContract
    }

    function fund() public payable {
        // want to be able to set a minimun fund amount in usd
        require(msg.value.convertPrice() >= minimumUsd, "Didn't send enough, please check the balance");
        funders.push(msg.sender);
        addressToAMountFunded[msg.sender] = msg.value;
    }

    function withdraw() public onlyAdmin {
        /* Start index, endng index, step amount */
        for(uint256 fundersIndex = 0; fundersIndex < funders.length; fundersIndex++) {
        //code
            address funder = funders[fundersIndex];
            addressToAMountFunded[funder] = 0;
        }
        // reset the array
        funders = new address[](0);
        (bool callSucess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSucess, "Call failed");
    }

    modifier onlyAdmin {
        require(msg.sender != i_owner, "Sender is not allowed, is not owner");
        //if (msg.sender != i_owner) { revert nowOwner(); }
        _;
    }

}