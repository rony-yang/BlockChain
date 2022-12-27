# BlockChain - Smart Contracts


**1. 개발 목표** : Smart Contracts를 사용한 블록체인 실습

**2. 메인 사진**

![main](https://user-images.githubusercontent.com/116271236/209612936-2d138a3f-d62d-474a-8d0a-05a2a5ff8576.png)

**3. URL 주소** : 별도 없음

**4. 작업기간** : 22. 12. 1 ~ 12. 2

**5. 사용 기술**

- 언어 : Solidity

- 프로그램 : Remix

- 서버 : node.js

**6. 주요기능**

- Smart Contracts 개념을 사용하여 돈(Ether)을 송금하고 받는 기능

- 소유주가 아닌 사람이 출금을 시도하면 에러 발생

- 스마트 계약 삭제

**7. Advanced Feature**

소유자가 아닌 사람이 출금을 시도하면 중지 문구가 뜨도록 상태를 제어할 수 있습니다

```solidity
// 스마트 계약 상태 제어 생성자 정의
address owner;
    
// 소유자만이 출금 가능한 함수 정의
function withdrawMoneyTo2(address payable _to) public {
  require(msg.sender == owner, "yor are not owner");
  require(!paused, "contract is paused"); // 상태 제어 - 중지
  _to.transfer(this.getBalance());
}
  ```
