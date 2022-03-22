# 4_ethereum_patterns_ERC

In the Ethereum blockchain we have a bunch of conventions, we can find them [here](https://eips.ethereum.org/erc), each ID is representative to a common list of rules to create a contract in the ethereum blockchain ( or similar ones ) that follows these rules so they have all the actually needed features implemented to be considered that type of contract.

I believe that the most famous know one is the ERC-20 token.

We can create this type of tokens without much effort by using interfaces and some imports.

In the bootcamp , after we learned about this patterns we created a mintable token, ERC20Mintable. We also got to know the concept of smart contract as a digital vendor machine.

```.sol
    pragma solidity 0.5.2;

    import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol';

    contract TokenBootCamp is ERC20Mintable{
        string public name = "Ethereum Rio Bootcamp";
        string public symbol = "ERB";
        uint8 public decimals = 2; 
    }
```
