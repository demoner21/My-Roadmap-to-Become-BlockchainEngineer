// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import "./SimpleStorage.sol";

contract StorageFactory is SimpleStorage {

    SimpleStorage[] public SSArray;

    function createSSContract() public {
        // generate a contract simpleStorage type
        SimpleStorage generateSS = new SimpleStorage();
        SSArray.push(generateSS);
    }

    function simpleFStore(uint256 index, uint256 age) public {
        // get the contract that we wanna  intereact
        SimpleStorage(address(SSArray[index])).store(age);
    }

    function simpleFRetrive(uint256 index) public view returns(uint256) {
        // to acess our contract once again
        return SimpleStorage(address(SSArray[index])).retrieve();
    }
}