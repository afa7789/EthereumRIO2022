pragma solidity 0.5.4;
// selfdestruct
// IsAlive
// How to know if your smart contract was selfdestructed?

contract Register04 {
    string private info;

    constructor() public {
        info = "Sol";
    }
    
    function getInfo() public view returns (string memory) {
        return info;
    }

    function setInfo(string memory _info) public {
        info = _info;
    }

    // selfdestruct function to end the contract
    function kill() public {
        selfdestruct(msg.sender);
    }

    // pure function doesn't read from the contract nor writes on it.
    function isAlive() public pure returns (bool) {
        return true;
    }     
}

