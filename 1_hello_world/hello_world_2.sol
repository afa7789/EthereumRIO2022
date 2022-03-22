pragma solidity 0.5.4;
// Hello World with a uint instead of a string
contract HelloWorld {
    uint private unsigned_integer;

    function get_unsigned_integer() public view returns (uint) {
        return unsigned_integer;
    }

    function set_unsinged_integer(uint new_value ) public {
        unsigned_integer = new_value;
    }
}
