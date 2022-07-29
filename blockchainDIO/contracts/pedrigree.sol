// SPDX-license-Identifier: MIT

pragma solidity >=0.5.0 <0.9.0;

// import adoption, if we can work with one contract, but they not necessarily
import "./Adoption.sol";

//declare we receive the adoption
contract Pedigree is Adoption {

    uint256 birthCertificate;

    struct registerPedigree {
        // make a struct to whe will work
        uint256 birthCertificate;
        string name;
    }

    registerPedigree[] pedigree;

    mapping(uint256 => string) public pedigreebirthCertificate;

    function storePedigreeLogBook(uint256 _birthCertificate) public  {
        birthCertificate = _birthCertificate;
    }

    // retive the last register
    function retriveLogBook() public view returns(uint256) {
        return birthCertificate;
    }

    function addPetLinege(string memory _name, uint256 _birthCertificate) public {
        pedigree.push(registerPedigree(_birthCertificate, _name));
        pedigreebirthCertificate[_birthCertificate] = _name;
    }

}