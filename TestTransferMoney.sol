pragma solidity ^0.8.7;

contract TestTransferMoney {

    uint public smartBalance;

    address owner;
    bool paused;

    constructor() public {
        owner = msg.sender;
    }

    function setPaused(bool _paused) public {
        require(msg.sender == owner, "you are not owner");
        paused = _paused;
    }

    function withdrawMoneyTo2(address payable _to) public {
        require(msg.sender == owner, "yor are not owner");
        require(!paused, "contract is paused");
        _to.transfer(this.getBalance());
    }

    function receiveMoney() public payable {
       smartBalance += msg.value;
    }

    function getBalance() public view returns(uint) {
         return address(this).balance;
    }

    function withdrawMoney() public {
        address payable _to = payable(msg.sender);
        _to.transfer(this.getBalance());
    }
}