// SPDX-License-Identifier: MIT
// you always have to set an solidity version, 
// do use > , < always use a fixed version, this is considered a good practice in solidity.
pragma solidity 0.8.7;
 
contract HelloWorld {
    // private variable can't be seen unless you create a get function for it.
    // public variables can be seen
    string private info;
   
    // view functions do not cost gas or money to be used
    // only public functions can be externally by other programns, persons, or whoever gets the contract hash.
    function getInfo() public view returns (string memory) {
        return info;
    }
    
    // this is a function that actually writes in the blockchain,
    // so it will cost you something to writes on variables.
    function setInfo(string memory _info) public {
        info = _info;
    }
}