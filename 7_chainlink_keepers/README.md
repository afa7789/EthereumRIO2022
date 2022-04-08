# 7_chainlink_keepers

In this repository we have four contracts. 
First is the token, then we have the token minter, one is a keeper and the other is an interface.
The minter can mint our previous token, the keeper calls the minter and the interface is used to help in this process.

we used remix in this one http://remix.ethereum.org/

### Step by step.

- Create a new account in metamask.
  - Connect with it at the faucet and chainlink keeper.
    - Get Faucets
  - Connect with it at the remix.
- Deploy your token. Mine is here: 0xE7D7C36A34385F3E0aAd9A34E3cefd4a405d814a
- Deploy your token minter, with the token you created previously. Mine is here: 0x2F0E69afa8A53b9D9a97Fa06826d792c1dC380e2
- Add your token minter, in the token, at the buttons in remix.
- Deploy your Keeper, adding your token minter, your wallet and a time interval. Mine is here: 0x9289825c63993002A83b965A1BDE02d50403B28a
  - verifiy your contract at etherscan
- At the Keeper's site, add the data for a new upkeeper/keeper register it, and see the magic happening of the ammount of token increasing in your account. Check mine here : https://keepers.chain.link/kovan/2865

## Token
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

In the remix mint 100 tokens of it, 100 tokens ERB = 10000, ( remember that we have 2 decimals )

## Interface Router
https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/UniswapV2Router02.sol 

0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D , this is the [interface](https://etherscan.io/address/0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D#code) we are using actually, we tried to create one, but due to time limitation in the bootcamp we used this on that was done, check up the file interface.sol to see what we were actually doing.

```sol
// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

abstract contract InterfaceRouter {
    
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable virtual returns (uint amountToken, uint amountETH, uint liquidity);

    address public WETH;

    //Si quiero comprar tokens X, ¿cuándo tengo que enviar tokens Y?
    function getAmountsIn(uint amountOut, address[] calldata path) 
        external view virtual returns (uint[] memory amounts);

    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
        external
        payable
        virtual
        returns (uint[] memory amounts);
}
```

## Token Minter
```sol
// SPDX-License-Identifier: MIT
pragma solidity 0.5.2;

interface IERC20Minter {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function mint(address account, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract TokenMinter {
    
    IERC20Minter public token;
    
    constructor(address tokenAddress) public {
        token = IERC20Minter(tokenAddress);
    }
  
    function mint(address account, uint256 amount) public returns (bool) {
        token.mint(account, amount);
        return true;
    }
    
}
```

## Token Keeper

```
//Begin
// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

//import "@chainlink/contracts/src/v0.8/KeeperCompatible.sol";
interface KeeperCompatibleInterface {
        function checkUpkeep(bytes calldata checkData) external returns (bool upkeepNeeded, bytes memory performData);
        function performUpkeep(bytes calldata performData) external;
}

//https://kovan.etherscan.io/token/0xa766631087e45d8e3061dd05e40a7aa39e52d712#balances
interface TokenMinterInterface {
        function mint(address account, uint256 amount) external returns (bool);
}

contract KeeperMinter is KeeperCompatibleInterface {

        uint public counter; // Public counter variable
        TokenMinterInterface public minter;
        address to; // who is going to receive the tokens

        // Use an interval in seconds and a timestamp to slow execution of Upkeep
        uint public immutable interval;
        uint public lastTimeStamp;    

        constructor(uint updateInterval, address tokenMinter, address _to) {
          interval = updateInterval;
          lastTimeStamp = block.timestamp;
          counter = 0;
          minter = TokenMinterInterface(tokenMinter);
          to = _to;
        }

        function checkUpkeep(bytes calldata checkData) external view override returns (bool upkeepNeeded, bytes memory performData) {
            upkeepNeeded = (block.timestamp - lastTimeStamp) > interval;
            performData = checkData;
        }

        function performUpkeep(bytes calldata performData) external override {
            lastTimeStamp = block.timestamp;
            counter = counter + 1;
            minter.mint(to, 100);
            performData;
        }
}
//End
```
