pragma solidity ^0.8.7;

contract TestTransferMoney {

    // 잔고 확인하기 위해 생성자 정의
    uint public smartBalance;

    // 소유자만이 출금 가능한 생성자 정의
    address owner;

    // 스마트 계약 상태 제어 생성자 정의
    bool paused;

    // 스마트 계약의 잔고 확인
    function getBalance() public view returns(uint) {
         return address(this).balance;
    }

    // 스마트 계약의 잔고 확인
    function receiveMoney() public payable {
       smartBalance += msg.value;
    }

    // 스마트 계약에서 출금
    function withdrawMoney() public {
        address payable _to = payable(msg.sender);
        _to.transfer(this.getBalance());
    }

    // 받을 주소 입력 가능한 출금 함수 생성
    function withdrawMoneyTo(address payable _to) public {
        _to.transfer(this.getBalance());
    }

    // 소유자만이 출금 가능한 함수 정의
    constructor() public {
        owner = msg.sender;
    }

    // 소유자만이 출금 가능한 함수 정의
    function withdrawMoneyTo2(address payable _to) public {
        require(msg.sender == owner, "yor are not owner");
        require(!paused, "contract is paused"); // 상태 제어 - 중지
        _to.transfer(this.getBalance());
    }
    
    // 스마트 계약 상태 제어 - 중지(pause)
    function setPaused(bool _paused) public {
        require(msg.sender == owner, "you are not owner");
        paused = _paused;
    }

    // 스마트 계약 삭제
    function destroySmartContract(address payable _to) public {
        require(msg.sender == owner, "you are not owner");
        selfdestruct(_to);
    }
} // --TestTransferMoney