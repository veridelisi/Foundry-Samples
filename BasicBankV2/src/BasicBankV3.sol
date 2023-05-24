// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

contract BasicBankV3 {

      mapping(address => uint256) public balances;

     function addEther() external payable {
        balances[msg.sender] += msg.value;
    }

    function sentEther(uint256 amount, address to)  public payable {
         require (balances[msg.sender] >= amount);
         balances[msg.sender] -= amount;
         balances[to] += amount;
        //payable(to).transfer(amount);
        (bool sent,) = payable(to).call{value: amount}("");
         require(sent);
    }
}
