# 5_hardhat_infura

These are two developer tools that we use. Hardhat is a dev scaffold or framework that we can use for development, it generates a cool frontend and help us deploy, test and do more with the contract. Infura is a nodes serverless company that we can use to host our applications.

## Hardhat

Site HardHat: https://hardhat.org/

Step by step on creating your own project:

```
mkdir hardhat_test && cd hardhat_test

npm init -y # this will answer yes to all

npm install --save-dev hardhat
npx hardhat
```
### the 4 basics commands in Hardhat

- compile the Contract => `npx hardhat compile`
- run a blockchain locally ( single node I believe) => `npx hardhat node`
- run a script: `npx hardhat run ./scripts/sample-script.js ` this uses the path for it.
- tests : `npx hardhat test`

For manually debugging and data visualization we have a package that can be added to contracts. The console.log package.

For using it we gotta: 
     
   1) import it at the begging: `import "hardhat/console.sol"`; 
   2) add code just like this in the contract: `console.log('info')`;
   3) running the console: `npx hardhat console --network goerli` , change goerli to the network you are using.


## Infura

Site infura: https://infura.io.

Sign up and create a new project.


## Integrating Infura and Hardhat

Here we have the .env.example needed for this experiment.

```.env.example
INFURA_PROJECT_ID=  # this we get at the infura site
INFURA_PROJECT_SECRET=  # this we get at the infura site
DEV_MNEMONIC= #  create a new wallet to do this, and never share your mnemonic
ETHERSCAN_KEY= # this key we get at the etherscan site
```

creating the .env

```
echo "
INFURA_PROJECT_ID=
INFURA_PROJECT_SECRET=
DEV_MNEMONIC=
ETHERSCAN_KEY=
" > .env.example
cp .env.example .env
```

After adding the data in the .env we gotta use the npm package to use it.

```
npm install --save-dev dotenv
patch < hardhat.config.patch # this will apply a patch in our config file.
```

## Extra verifying a contract

We can use hardhat to verify a contract, and that's why we add a etherscan apikey in our .env after the deployment do the bellow:

`npx hardhat verify --network NETWORK_NAME CONTRACT_ADDRESS INFO_USED_TO_DEPLOY`

Example:

`npx hardhat verify --network goerli 0x8b91856Fe8B29493e615fBCA81B94B61DFcc670C 'Hello, Hardhat!'`

better to install the etherscan hardhat package if you didn't before:

`npm install @nomiclabs/hardhat-etherscan`