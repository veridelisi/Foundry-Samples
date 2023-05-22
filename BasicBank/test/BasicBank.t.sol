// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/BasicBank.sol";

contract BasicBankTest is Test {
    BasicBank public basicBank;

    function setUp() public {
        basicBank = new BasicBank();
    }

    function testAddEther() external {
        vm.deal(address(this), 1 ether);
        basicBank.addEther{value: 1 ether}();
        assertEq(
            address(basicBank).balance,
            1 ether,
            "expected balance of basic bank contract to be 1 ether"
        );
    }

    function testRemoveEther() external {
      vm.deal(address(this), 1 ether);
        emit log_named_decimal_uint("BANK has ", address(basicBank).balance, 18);
        emit log_named_decimal_uint("Address has ", address(this).balance, 18);

        vm.expectRevert();

        basicBank.removeEther(1);
        emit log_named_decimal_uint("Bank Remove 1 ether in BANK", address(basicBank).balance, 18);
        emit log_named_decimal_uint("Bank Remove 1 ether in Address", address(this).balance, 18);


        basicBank.addEther{value: 1 ether}();
        emit log_named_decimal_uint("Bank Add 1 ether in BANK", address(basicBank).balance, 18);
        emit log_named_decimal_uint("Bank Add 1 ether in Address", address(this).balance, 18);

        basicBank.removeEther(1 ether);
        emit log_named_decimal_uint("Bank RE-Remove 1 ether in BANK", address(basicBank).balance, 18);
        emit log_named_decimal_uint("Bank RE-Remove 1 ether in Address", address(this).balance, 18);
        assertEq(
            address(this).balance,
            1 ether,
            "expected balance of address(this) to be 1 ether"
        );
    }

    receive() external payable {}
}
