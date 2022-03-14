# 0_web3
This folder only contains a readme with certain topics and step by step part for each of it.
Table of Content:

- [0_web3](#0_web3)
  - [Web3](#web3)
  - [Wallet](#wallet)
  - [Hash](#hash)
  - [EtherScan](#etherscan)
  - [TestNets](#testnets)
  - [Faucets](#faucets)
  - [Remix](#remix)

## Web3

> "Web3 is an idea for a new iteration of the World Wide Web based on blockchain technology, which incorporates concepts including decentralization and token-based economics. Some technologists and journalists have contrasted it with Web 2.0, wherein they say data and content are centralized in a small group of companies sometimes referred to as "Big Tech"." [Wikipedia](https://en.wikipedia.org/wiki/Web3)

In the decentralized space of blockchain and web3 most of it components run on technologies such as Ethereum and other smarcontract chains, that allows people due to it's turing complete trait to run code in it and use the statefullness of the blockchain to store data and do operations.

But to be using the blockchain and it's resources we actually have to pay some fees, and that's why we are abording each one of the contents bellow. We will need this topics to actually use the web3 and take part of it.

## Wallet

Wallet is the part of the web3 that stores your crypto assets. You have to be responsible because you are the owner, and is deed to you the protection of your own stuff. With the wallet we can store our coins and use them to either pay for services or goods.

So you will need to actually have an wallet installed in your computer if you want to develop for blockchain. You could have the wallet in your cellphone too, but for developing purpose I strongly recommend in using a computer one.

We actually was introduced to two of these wallets, [Punk Wallet](https://punkwallet.io/) and [MetaMask](https://metamask.io/). Try to give preferrence to meta , it looks like to be the wallet with higher number of integrations.

A wallet will have a public key, a secret key and a 12 word secret recovery phrase. The public key you can share with everyone else, the secret key and the twelve word recovery phrase you should not share. Otherwise you will be probably be stolen.

`small disclaimer: when we are using the web3 we are mostly using Ethereum, since bitcoin doest not have a smart contract system and Ethereum have the highest adoption after it.`


## Hash

So Hash, I'll be brief in this one, in computer science hash is a function that for each individual input will have an unique output.and is used for several different purposes. Examples include cryptography, compression, checksum generation, and data indexing...

In crypto we have some diferent hashes that works as addresses for wallets, contracts, transactions. These hashes have their ownpatterns and are able to be used to identify what is what and give a general context to everything else that is working around it.

Check hash in this demo bellow:
[Hash Visualizer](https://andersbrownworth.com/blockchain/hash)

## EtherScan

Etherscan is one of tools that a web3 developer will be using mostly in his daily life. Since it allows you to not only see wallets, contracts , transactions and averiguate them but allows you to interact with other smart contracts too. It's a tool that's knowed as Blockchain Explorer, you have other ones for other cryptos too, but I believe this one is the most used. 

So when are you going to use Etherscan ? After you deploy a contract, make a contract , receive an address , etc... You can use it for jobs and task that will require you to inspect what is going on in the block chain, so detective work.

Check [EtherScan](https://etherscan.io/) here.

## TestNets

MainNet is the term you will usually see to refer to the original or the in actual use network of ethereum. This network actually needs real money to be used, so you shouldn't deploy or plan to use it before bein certain you actually have a real product and that's where the test nets enter the game.

TestNets are "fake" but real blockchain networks where developers can deploy their contracts and test'em with borrowed valueless coins, they exist to prevent people from testing in the real chain and deploying broken contracts to it. So it's an instance of a blockchain powered by the same or a newer version of the underlying software, to be used for testing and experimentation without risk to real funds or the main chain.

Some random links, about test nets, I'm including the three test nets we have used in the course:


- [Kovan](https://kovan-testnet.github.io/website/)
- [Kovan Etherscan](https://kovan.etherscan.io/)
- [Rinkeby Explorer](https://www.rinkeby.io/#stats)
- [Rinkeby Etherscan](https://rinkeby.etherscan.io/)
- [Goerli](https://goerli.net/)
- [Goerli Etherscan](https://goerli.etherscan.io/)

## Faucets

Faucets is an app or a website that distributes small amounts of cryptocurrencies, usually after some task completion. BUT on testnets we have a bunch of faucets that we can use to get "fake" crypto to be able to test aplications and actually learn how to do stuff.

Here are some of the faucets we used, but there are plenty other ones out there:
- [Goerli Social Faucet](https://goerli-faucet.mudit.blog/) , you need a social network link for it. ( like a twitter post)
- [Rinkeby Chainlink Faucet](https://faucets.chain.link/rinkeby).
- [Rinkeby and Kovan Faucet](https://faucet.daostack.io/)
- [Kovan Faucet](https://ethdrop.dev/)

## Remix

So to develop and code usually we write it in a notepad and compile, or use an IDE. For solidity we have REMIX that's a browser IDE that is able to not online compile but connect to other networks and deploy your smart contract. So it's one of the best tools used in the blockchain developer ecosystem it's one of the default tools used [check Remix here](https://remix.ethereum.org/).

