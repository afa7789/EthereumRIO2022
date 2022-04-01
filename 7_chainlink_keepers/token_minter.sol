
//Inicio
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
//Fim