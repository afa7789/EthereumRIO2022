
//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.0;

// CONTRATO INVENTARIO
contract InventarioSample {
        mapping(address => uint) herancas;

        uint256 public dataDeRetirada;

        constructor(uint _dataRetirada) public {
                require(_dataRetirada > 0, "data precisa estar no futuro");
                dataDeRetirada = block.timestamp + _dataRetirada;
        }

        function adicionarFundos(address herdeiro) public payable {
                require(msg.value > 0, "deposito nao pode ser vazio");

                herancas[herdeiro] = msg.value;
        }

        function saque() public {
                require(herancas[msg.sender] > 0, "vc nao eh o herdeiro");
                require(block.timestamp > dataDeRetirada, "nao chegou a hora!");

                herancas[msg.sender] = 0;

                payable(msg.sender).transfer(herancas[msg.sender]);
        }

        function heranca(address herdeiro) public view returns (uint256) {
                return herancas[herdeiro];
        }
}
