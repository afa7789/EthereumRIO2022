pragma solidity 0.5.2;

// importing the mintable token format
// openzeppelin is a group/project that shares this implementations so others can actually use them easily.
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol';

// the contract is smaller in this case because we are already importing all the functions that a ERC20Mintable have.
contract TokenBootCamp is ERC20Mintable{
    string public name = "Ethereum Rio Bootcamp";
    string public symbol = "ERB";
    uint8 public decimals = 2; 
}