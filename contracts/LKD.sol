pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20Burnable.sol";

contract LKDToken is ERC20Burnable {
    string public name = "LakeDiamond Token";
    string public symbol = "LKD";
    uint256 public decimals = 0;

    constructor() public {
        _mint(msg.sender, 141120000);
    }
}