pragma solidity 0.5.4;
// mapping with array of structs
// using of pure functions
// usage of abi encode

contract Register16 {
    address payable public owner;
    mapping (address => bool) public whiteList;
    
    //enum ColorInfo {Out = 0, Blue = 1, Blue = 2}
    enum ColorInfo {Undefined, Blue, Red}
    
    struct InfoStruct {
        ColorInfo color;
        string info;
    }
    // one struct per address
    mapping (address => InfoStruct[]) public infos;

    constructor() public {
        owner = msg.sender;
        whiteList[owner] = true;
        InfoStruct memory infoAux = InfoStruct ({
            color: ColorInfo.Undefined,
            info:  string(abi.encodePacked("Hello World", toAsciiString(owner)))
        });        
        infos[owner].push (infoAux);
    }

    event InfoChange(address person, string oldInfo, string newInfo);
    
    /* ====================MODIFIERS==================*/

    modifier onlyOwner {
        require(msg.sender == owner,"Only owner");
        _;
    }

    modifier onlyWhitelist {
        require(whiteList[msg.sender] == true, "Only whitelist");
        _;
    }

    /* ====================INFO HANDLERS==================*/


    function getInfo(uint index) public view returns (ColorInfo, string memory) {
        return (infos[msg.sender][index].color, infos[msg.sender][index].info);
    }

    function setInfo(uint index, ColorInfo _color, string memory _info) public onlyWhitelist {
        emit InfoChange (msg.sender, infos[msg.sender][index].info, _info);
        infos[msg.sender][index].color = _color;
        infos[msg.sender][index].info = _info;
    }
    
    function addInfo(ColorInfo _color, string memory _info) public onlyWhitelist returns (uint index) {
        InfoStruct memory infoAux = InfoStruct ({
            color: _color,
            info: _info
        });        
        index = infos[msg.sender].push (infoAux) - 1;        
    }   

    function getLength() public view returns ( uint) {
        return (infos[msg.sender].length);
    }

    /* =============ADDRESS TO STRING ================*/
    
    // ADDRESS to string
    function toAsciiString(address x) internal pure returns (string memory) {
        bytes memory s = new bytes(40);
        for (uint i = 0; i < 20; i++) {
            bytes1 b = bytes1(uint8(uint(uint160(x)) / (2**(8*(19 - i)))));
            bytes1 hi = bytes1(uint8(b) / 16);
            bytes1 lo = bytes1(uint8(b) - 16 * uint8(hi));
            s[2*i] = char(hi);
            s[2*i+1] = char(lo);            
        }
        return string(s);
    }

    // BYTE TO CHAR 
    function char(bytes1 b) internal pure returns (bytes1 c) {
        if (uint8(b) < 10) return bytes1(uint8(b) + 0x30);
        else return bytes1(uint8(b) + 0x57);
    }
    

    /* ==============SELFDESTRUCT IS ALIVE=============*/

    function kill() public onlyOwner {
        selfdestruct(owner);
    }

    function isAlive() public pure returns (bool) {
        return true;
    }

    /* =================WHITELIST STUFF=================*/

    function addMember (address _member) public onlyOwner {
        whiteList[_member] = true;
    }
    
    function delMember (address _member) public onlyOwner {
        whiteList[_member] = false;
    }    
}