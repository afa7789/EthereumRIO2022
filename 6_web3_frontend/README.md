# 6_web3_frontend

The web3 enviroment need people to integrate the web2 component to itself. So not only solidity is needed, in this folder I'm going to explain parts of a code that we will borrow from a repository.

The repository we are going to use is in this git clone bellow:
`git clone https://github.com/ggviana/bootcamp-ethrio`

We only need to analyse two files from it, and this requires you to have at least some knowledge of react and it's hooks.

Important files to check in the repo above:

- useInventario.js

```js

import { ethers } from 'ethers'
import { useEffect, useState } from 'react'

// 0x104F89d9c3c46a294cDcC31a1279f0707611497a

// abi this is like the header functions of the contract
const abi = [
  "function heranca(address herdeiro) public view returns(uint256)",
  "function adicionarFundos(address herdeiro) public payable",
  "function saque() public",
];

// function to connect to the contract.
export default function useInventario (provider) {
  const [valorHeranca, setValorHeranca] = useState(null)
  const [contract, setContract] = useState(null)

  useEffect(() => {
    if (provider) {
      (async () => {
        // this provider is received from the metamask
        const signer = provider.getSigner()
        // this is the wallet addres of the contract signer
        const address = await signer.getAddress()
        // this is the bridge creates a contract object that uses the abi functions above
        const contract = new ethers.Contract('0x104F89d9c3c46a294cDcC31a1279f0707611497a', abi, provider)
        // call the function in the solidity contract but in javascript
        const valorHeranca = await contract.heranca(address)
        setValorHeranca(valorHeranca)
        setContract(contract)
      })()
    }
  }, [provider])

  return [valorHeranca, contract]
}
```

- useMetamask.js
```js

import { ethers } from 'ethers'
import { useEffect, useState } from 'react'

export default function useMetamask () {
  const [provider, setProvider] = useState(null)

  useEffect(() => {
    if (window.ethereum) {
      const provider = new ethers.providers.Web3Provider(window.ethereum);
      provider.send("eth_requestAccounts", []).then(() => setProvider(provider));
    }
  }, [])

  return provider
}

```

- App.js, : this file is only the react frontend that uses the two .js cited above to show data in the screen.
```js
    // ... more code not show above
    return (
        <div className="App">
        <h1>My Address: {myAddress}</h1>
        {/* using the ether lib here to format the wallet balance, this is used by integrating with metamask*/}
        <h2>My Balance: {myBalance && ethers.utils.formatEther(myBalance)}</h2>
        {/* using the ether lib here to format the wallet balance */}
        <p>Valor da minha herança: {valorHeranca && ethers.utils.formatEther(valorHeranca)}</p>
        <button onClick={async () => {
            // this here is another interation of integration with a contract.
            // instead of using a function in a lib we are calling the function directly in the js at the react part
            // here he is adding funds to a data structure in a contract.
            const signer = provider.getSigner()
            await contract.connect(signer).adicionarFundos(myAddress, { value: ethers.utils.parseEther('0.001') })
        }}>Adicionar 0.001 ETH a herança</button>
        </div>
    );
    // ... more code not show bellow

```

in `inventario.sol` we can see how exactly works the contract that it's being used in the code and repository cited above.
