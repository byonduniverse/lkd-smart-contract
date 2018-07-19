pragma solidity 0.4.24;
import "openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";


contract PoolBidToken is MintableToken {

    mapping(address => bool) public whitelist;
    mapping(bytes32 => uint8) public levelKYC;
    Bid[] public bids;
    Order[] public orders;

    struct Bid {
        address investor;
        uint256 tokensBid;
        uint256 limitCHF;
        string diamondType;
        uint256 ethToBeClaimed;
    }

    struct Order {
        uint256 tokensNeeded;
        uint256 priceCHF;
        string diamondType;
        string metadata;
        uint expirationDate;
        bool status;
    }

    function createOrder(uint256 _tokensNeeded, uint256 _priceCHF, string _diamondType, string _metadata) {
        Order memory order = Order(
            _tokensNeeded,
            _priceCHF,
            _diamondType,
            _metadata,
            now + 1 days,
            false
        );
        orders.push(order);
    }

}
