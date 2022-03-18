# 2_solidity_fundamentals

This repository have three set of code : regiter3, register5 and register16 they are starting examples of solidity code by using features that the language provide us.

## keywords

### public and private.

Public and view are used to control what is used inside the contract and can be used outside of it.

### constructor

Constructor is a function that is called at the start/deploy of the contract and define what is being built, setting up initial values.

### view

View are types of functions that only read states of the chain//contract and does not change it.

### pure

Pure does not read or write, and can be used to do functions unrelated to data that are on the contract, as a math calculation that will only be returned and not stored.

### selfdestruct

Destroys the contract so no one can use it again.

### sender && owner

Owner is only a key we usually use to know who is the deployer of it and Sender is who is calling the transaction

### modifiers

Modifiers are type of function changers you can replicate so you don't need to write the same type of control for each function.

### mapping

Mapping creates a map a type of data structure of one thing to another.

### address

Address is the type that stores the address of : wallet, tokens, NFT's, contracts, etc...

### require

Require is a keyword used to assert certain thing and control to avoid error.

### memory and storage

Memory and storage are for data which can have more than 256 bits, memory is used when it is not persistent and storage when it is. [more on it](https://medium.com/coinmonks/ethereum-solidity-memory-vs-storage-which-to-use-in-local-functions-72b593c3703a).

### event

Event is a keyword to define an event to emit when something happens, it can be used in other codes to keep listening to it.

### payable

This keyword allows a code to actually receive ethers as payment, this is used so that functions without can't receive ether.

### struct

Struct defines a data structure.

### enum

Enum is only a simple enumerator.




