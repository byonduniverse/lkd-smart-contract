pragma solidity 0.4.24;
import "openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";


contract PoolBidToken is MintableToken {
    event OrderCreated(
        uint256 id,
        uint256 tokensNeeded,
        uint256 priceCHF,
        string diamondType,
        string metadata,
        uint expirationDate
    );

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

    modifier isWhitelisted() {
        require(whitelist[msg.sender] == true);
        _;
    }

    function createOrder(uint256 _tokensNeeded, uint256 _priceCHF, string _diamondType, string _metadata) public {
        uint timestamp = now + 1 days;
        Order memory order = Order(
            _tokensNeeded,
            _priceCHF,
            _diamondType,
            _metadata,
            timestamp,
            false
        );
        orders.push(order);
        emit OrderCreated(orders.length, _tokensNeeded, _priceCHF, _diamondType, _metadata, timestamp);
    }

    function createBid(uint256 _tokenAmount, uint256 _limitCHF, string _diamondType) public isWhitelisted {
        require(balances[msg.sender] >= _tokenAmount);

        // Update smart contract state.
        balances[msg.sender] = balances[msg.sender].sub(_tokenAmount);
        totalSupply_ = totalSupply_.sub(_tokenAmount);

        //Update bidQueue state.
        Bid memory newBid = Bid(msg.sender, _tokenAmount, _limitCHF, _diamondType, 0);
        bids.push(newBid);
    }

}
