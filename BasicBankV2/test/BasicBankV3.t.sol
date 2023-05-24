// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/BasicBankV2.sol";

contract BasicBankV3Test is Test {
    //contract copy
    BasicBankV3 public basicBankV3;

    //address
    address  engin;
    address  emre;
   
  

    function setUp() public {
        //contract copy setup
        basicBankV3 = new BasicBankV3();
        //address
        emre = makeAddr("Emre");
        vm.deal(emre, 11 ether);
        engin = makeAddr("Engin");
        vm.deal(engin, 20 ether);
    }

     function testAddEther() external {
        vm.startPrank(emre);
        
        basicBankV3.addEther{value: 5 ether}();
        vm.stopPrank();
      
         emit log_named_decimal_uint("Bank Account Balance", address(basicBankV3).balance, 18);
         emit log_named_decimal_uint("Emre Account Balance ", address(emre).balance, 18);

        vm.startPrank(engin);
       
        basicBankV3.addEther{value: 5 ether}();
        vm.stopPrank();
      

        emit log_named_decimal_uint("Bank Account Balance", address(basicBankV3).balance, 18);
        emit log_named_decimal_uint("Engin Account Balance ", address(engin).balance, 18);

        vm.startPrank(emre);
        basicBankV3.sentEther( 4 ether, engin);
        vm.stopPrank();
       
         emit log_named_decimal_uint("Engin Account Balance ", address(engin).balance, 18);
         emit log_named_decimal_uint("Bank Account Balance", address(basicBankV3).balance, 18);
         emit log_named_decimal_uint("Emre Account Balance ", address(emre).balance, 18);
         
        
        vm.startPrank(engin);
        basicBankV3.sentEther(2 ether, emre);
        vm.stopPrank();
        emit log_named_decimal_uint("Engin Account Balance ", address(engin).balance, 18);
        emit log_named_decimal_uint("Emre Account Balance ", address(emre).balance, 18);
        emit log_named_decimal_uint("Bank Account Balance", address(basicBankV3).balance, 18);
  
    }

    receive() external payable {}
}
