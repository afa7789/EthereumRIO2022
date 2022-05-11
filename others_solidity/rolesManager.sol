// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.1;

contract RolesManager {
    /* =================INITIAL DATA=================*/
    address payable public owner;

    mapping (address => string[]) public roleList;
    mapping (address => bool) public whiteList;

    modifier onlyWhitelist {
        require(whiteList[msg.sender] == true, "Only whitelist");
        _;
    }

    constructor() public {
        owner = payable(msg.sender);
        whiteList[owner] = true;
    }

    /* =================ROLE=================*/

    function hasRole(string memory role,address this_guy) public view returns (bool) {
        uint lng = roleList[this_guy].length;
        for (uint j = 0; j < lng; j ++) {
            if ( keccak256(abi.encodePacked(roleList[this_guy][j])) == keccak256(abi.encodePacked(role)) ){
                return true;
            }
        }
        return false;
    }

    function AddRole(string memory role, address this_guy) public onlyWhitelist {
        roleList[this_guy].push(role);
    }

    /* =================WHITELIST=================*/

    function addMember (address _member) public onlyWhitelist {
        whiteList[_member] = true;
    }
    
    function delMember (address _member) public onlyWhitelist {
        whiteList[_member] = false;
    } 

    /* ==============SELFDESTRUCT IS ALIVE=============*/

    function kill() public onlyWhitelist {
        selfdestruct(owner);
    }

    function isAlive() public pure returns (bool) {
        return true;
    }
}
