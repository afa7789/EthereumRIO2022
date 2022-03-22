# 3_scaffold_and_token

Scaffold is a developer tool used to visualize and test the contracts.

## Initial config:

Prerequisites: Node (v16 LTS) plus Yarn and Git.

clone/fork 🏗 scaffold-eth:
    
yarn chain:

    `git clone https://github.com/scaffold-eth/scaffold-eth.git`

Install and start your 👷‍ Hardhat chain:
        
    `cd scaffold-ethr`
    `yarn install`

You will find the contract at `packages/hardhat/contract/yourcontract.sol`

in a second terminal window, start your 📱 frontend:
    
    `yarn start`

in a third terminal window, 🛰 deploy your contract:
    
    `yarn deploy`

You can always try and use the [punkwallet](https://punkwallet.io/) for testing since it's a burn wallet.
