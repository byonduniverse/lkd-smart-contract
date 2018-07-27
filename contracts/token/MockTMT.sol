pragma solidity 0.4.24;
import "openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";
import "./PoolBidToken.sol";


contract MockTMT is PoolBidToken {

    string public constant NAME = "MockTMT"; // solium-disable-line uppercase
    string public constant SYMBOL = "MTMT"; // solium-disable-line uppercase

    uint256 public constant INITIAL_SUPPLY = 1000000;

    constructor() public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        emit Transfer(0x0, msg.sender, INITIAL_SUPPLY);
    }

    function buyTMT(uint256 amount) public returns (bool) {
        balances[msg.sender] = balances[msg.sender].add(amount);
        emit Transfer(owner, msg.sender, amount);
        return true;
    }

}
