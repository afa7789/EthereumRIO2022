# 1_hello_world
This folder contains the README and the solidity code to make a hello_world_esque smart contract in a test net.
And some instructions to help guide you in pre-parts before testing it.

<!-- guide to use REMIX, add some pictures too here. -->
1. open [remix](https://remix.ethereum.org/)
2. log into your wallet.
3. create a new workspace (create button it's a +), add a new file hello_wold.sol and in it and paste the code bellow:
```.sol
    // SPDX-License-Identifier: MIT
    pragma solidity 0.8.7;
    
    contract Register01 {
        string private info;
    
        function getInfo() public view returns (string memory) {
            return info;
        }
    
        function setInfo(string memory _info) public {
            info = _info;
        }
    }
```
3. In 'SOLIDITY COMPILER', second tab item in the left navbar, set auto-compile as true ( mark the checkbox). 
4. At 'DEPLOY & RUN TRANSACTIONS' , third tab item in the left navbar, you will have to do the following:
   1. Set 'ENVIRONMENT' as : Injected Web3.
   2. Open your wallet change for Goerli TestNet, if you do not have credits in it use a goerli faucet. [Simple](https://fauceth.komputing.org/?chain=5) with a tweet [social](https://goerli-faucet.mudit.blog/). After you get some eth progress bellow. ( goerli must be showing bellow 'ENVIROMENT' in a chip)
   3. Choose in 'CONTRACT': HelloWorld - hello_world.sol
   4. Click on 'Deploy'
5. Good now you can test your contract it will be showed in the same tab like the image bellow : ![!Theme Image](https://github.com/afa7789/EthereumRIO2022_solidity_showcase/blob/master/resources/hello_world.png)
6. Yellow buttons is functions that spends coins. Blue are view functions and are free to use. The yellow one will set a value to the variable and the blue one just read it, when using a yellow button the wallet will ask for authorization to use your coins in the transaction.
7. You can click in the clipboard value and get the contract id. Mine is here (at goerli testnet ),  0xC35fc5CEF2460e31285755F4294eaBC5c7b90341. Check it on goerli [Etherscan](https://goerli.etherscan.io/address/0xC35fc5CEF2460e31285755F4294eaBC5c7b90341).
8. You can interact with the contract not only in the place showed in the image above but in the contract tab in etherscan, but for that the code must be validated (this was covered in other part of the bootcamp.)
