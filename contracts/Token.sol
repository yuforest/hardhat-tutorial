// バージョンのバリデーション
pragma solidity ^0.7.0;

import "hardhat/console.sol";

// コントラクトのメイン部分
contract Token {
  // 変数
  string public name = "My Hardhat Token";
  string public symbol = "MHT";

  // 256bitの符号なし整数
  uint256 public totalSupply = 1000000;

  // address(イーサリアムのアカウントを保持)
  address public owner;

  // key value map
  mapping(address => uint256) balances;

  // コントラクトの初期化
  constructor() {
    // totalSupplyは送り主に割り当てられる
    balances[msg.sender] = totalSupply;
    owner = msg.sender;
  }

  // トークンを送るための関数
  // externalを付けることでコントラクトの外側からのみ呼び出すことができる
  function transfer(address to, uint256 amount) external {
    // 送り主が十分なトークンを持っているか確認
    // requireの1つ目の引数がfalseならトランザクションは切り戻しされる
    // ガード文的なやつ
    console.log("Sender balance is %s tokens", balances[msg.sender]);
    console.log("Trying to send %s tokens to %s", amount, to);
    require(balances[msg.sender] >= amount, "Not enough tokens");

    // 送金する
    balances[msg.sender] -= amount;
    balances[to] += amount;
  }

  // 与えられたアカウントの残高を返す読み取り専用の関数
  // viewがついているとコントラクトの状態を変更しないことを示す(トランザクションを実行できない)
  function balanceOf(address account) external view returns (uint256) {
    return balances[account];
  }
}