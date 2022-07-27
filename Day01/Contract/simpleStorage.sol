// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;
// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;

contract Human {

    uint256 age;

    struct Pilot {
        uint256 age;
        string name;
    }
    // uint256[] public anArray;
    Pilot[] public pilot;

    mapping(string => uint256) public personAge;

    function store(uint256 _age) public virtual {
        age = _age;
    }

    function retrieve() public view returns (uint256){
        return age;
    }

    function add(string memory _name, uint256 _age) public {
        pilot.push(Pilot(_age, _name));
        personAge[_name] = _age;
    }
}