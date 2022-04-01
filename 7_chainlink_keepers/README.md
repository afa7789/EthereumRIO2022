# 7_defi_in_practice

we used remix in this one http://remix.ethereum.org/

Create the file token.sol

```sol
//Inicio
// SPDX-License-Identifier: MIT
pragma solidity 0.5.2;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol';

contract Token is ERC20Mintable{
    string public name = "Ethereum Rio Bootcamp";
    string public symbol = "ERB";
    uint8 public decimals = 2; 
}
//Fim
```

In the remix mint 100 tokens of it, 100 tokens ERB = 10000, ( because we have 2 decimals )


## UniswapV2Router02 Interface
https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/UniswapV2Router02.sol 

0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D , this is the [interface](https://etherscan.io/address/0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D#code) we are using actually, we tried to create one, but due to time limitation in the bootcamp we used this on that was done, check up the file interface.sol to see what we were actually doing.
