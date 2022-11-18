// SPDX-License-Identifier: MIT
pragma solidity >0.4.23 <0.9.0;
import "./Foundation.sol";
import "@optionality.io/clone-factory/contracts/CloneFactory.sol";
import "zeppelin-solidity/contracts/ownership/Ownable.sol";


contract FoundationFactory is Ownable, CloneFactory {

  address public libraryAddress;

  event FoundationCreated(address newFoundation);

  function FoundationFactory(address _libraryAddress) public {
    libraryAddress = _libraryAddress;
  }

  function setLibraryAddress(address _libraryAddress) public onlyOwner {
    libraryAddress = _libraryAddress;
  }

  function createFoundation(string _name) public onlyOwner {
    address clone = createClone(libraryAddress);
    Foundation(clone).init(_name);
    FoundationCreated(clone);
  }
}
