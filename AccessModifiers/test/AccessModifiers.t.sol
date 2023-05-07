// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/AccessModifiers.sol";

contract AccessModifiersTest is Test {
    Child public child;

    function setUp() public {
        child = new Child();
    }

    function testAccessModifiers() external {
        child.setValue(100);
        assertEq(child.getValue(), 100, "expected to be 100");

     
        child.setValue(5);
        assertLt(child.getValue(), 10, "expected to be less than 10");
        
        child.setValue(10);
        assertLe(child.getValue(), 10, "expected to be less than 10 or equal to 10 ");
        
        child.setValue(100);
        assertGt(child.getValue(), 10, "expected to be greater than 10");
        
        child.setValue(10);
        assertGe(child.getValue(), 10, "expected to be greater than 10 or equal to 10")
        
        child.setValue(1 ether);
        assertEqDecimal(child.getValue(), 1e18 wei, 18, "expected to be 18 decimals")

       
    }
}
