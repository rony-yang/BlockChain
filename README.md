# BlockChain


**1. 개발 목표** : Token 생성 / Smart Contracts 실습

**2. 메인 사진**

![main](https://user-images.githubusercontent.com/116271236/209612936-2d138a3f-d62d-474a-8d0a-05a2a5ff8576.png)

**3. URL 주소** : 별도 없음

**4. 작업기간** : 22. 11. 28 ~ 11. 30

**5. 사용 기술**

- 언어 : Solidity

- 프로그램 : Remix, MetaMask

- 서버 : node.js

**6. 주요기능**

- 나만의 Token을 생성

- Smart Contracts 개념을 사용하여 돈(Ether)을 송금하고 받는 기능

- 소유주가 아닌 사람이 출금을 시도하면 에러 발생

**7. Advanced Feature**

나만의 Token을 생성하여 MetaMask(지갑)과 연동할 수 있습니다

```solidity
constructor() public {
  symbol = "TOKEN";
  name = "YangToken";
  decimals = 18;
  _totalSupply = 1000000000000000000; // 1원
  balances[0x878Be87755d8f6883121A134090788220CF7b15f] = _totalSupply; // 본인 메타마스크 지갑 주소
  emit Transfer(address(0), 0x878Be87755d8f6883121A134090788220CF7b15f, _totalSupply);
}
  ```
