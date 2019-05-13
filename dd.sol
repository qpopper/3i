contract Donation {
    address owner;
    event fundMoved(address _to, uint _amount);
    modifier onlyowner { if (msg.sender == owner) _; }
    address[] _giver;
    uint[] _values;

    function Donation() {
        owner = msg.sender;
    }

    function donate() payable {
        addGiver(msg.value);
    }

    function moveFund(address _to, uint _amount) onlyowner {
        uint balance = this.balance;
        uint amount = _amount;
        if (_amount <= this.balance) {
            if (_to.send(_amount)) {
                fundMoved(_to, _amount);
            } else {
                throw;
            }
        } else {
            throw;
        }
    }

    function addGiver(uint _amount) internal {
        _giver.push(msg.sender);
        _values.push(_amount);
    }
}