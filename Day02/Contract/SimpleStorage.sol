// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract SimpleStorage {
    uint256 age;

    struct Pilot {
        uint256 age;
        string name;
    }
    Pilot[] public titan;

    mapping(string => uint256) public pilotAge;

    function store(uint256 _age) public virtual {
        age = _age;
    }

    function retrieve() public view returns (uint256){
        return age;
    }

    function add(string memory _name, uint256 _age) public {
        titan.push(Pilot(_age, _name));
        pilotAge[_name] = _age;
    }
}