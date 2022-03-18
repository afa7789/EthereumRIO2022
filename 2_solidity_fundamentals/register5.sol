// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
 
contract Register05 {
    // array shared
    string[] private info;
    // address type of data
    address public owner;
    // mapping from an address as index to a boolean variable
    mapping (address => bool) public whiteList;
 
    constructor() {
        owner = msg.sender;
        // in this case whitelist is a way of controling who can use this contract
        // and the owner is the sender who deploys.
        whiteList[msg.sender] = true;
    }
    
    // event to be emited
    event InfoChange(string oldInfo, string newInfo);
    
    // modifier , only when the owner is asking the function will work
    modifier onlyOwner {
        require(msg.sender == owner,"Only owner");
        _;
    }
 
    // modifier , only when the sended is at the whitelist that the function will work
    modifier onlyWhitelist {
        require(whiteList[msg.sender] == true, "Only whitelist");
        _;
    }
    
    // part where it manipulates info
    function getInfo(uint index) public view returns (string memory) {
        return info[index];
    }
 
    function setInfo(uint index, string memory _info) public onlyWhitelist {
        emit InfoChange (info[index], _info);
        info[index] = _info;
    }
   
    function addInfo(string memory _info) public onlyWhitelist returns (uint index) {
        info.push (_info);
        index = info.length -1;
    }
     
    function listInfo() public view returns (string[] memory) {
        return info;
    }

    // part where it manipulates whitelist 
    function addMember (address _member) public onlyOwner {
        whiteList[_member] = true;
    }
   
    function delMember (address _member) public onlyOwner {
        whiteList[_member] = false;
    }    
}