// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/BasicStorage.sol";

//forge inspect BasicStorage storage-layout --pretty

contract BasicStorageTest is Test {
    BasicStorage public basicStorage;

    function setUp() public {
        basicStorage = new BasicStorage();
    }

    function testSetX() external {
        //changing slot 0
        basicStorage.setX(42);
        //loading slot 0
        uint256 x = uint256(
            vm.load(address(basicStorage), bytes32(uint256(0)))
        );
        // control slot 0
        assertEq(x, 42, "expected x in storage to be 42 after setX(42)");
    }

     function testSetX2() external {
        //loading slot 1
        uint256 x = uint256(
            vm.load(address(basicStorage), bytes32(uint256(1)))
        );
        // control slot 1
        assertEq(x, 43, "expected x in storage to be 42 after setX(42)");
    }

   function testGetX() external {
    //changing slot 0
    basicStorage.setX(49);
    // getting slot 0
    uint256 x = basicStorage.getX();
    //control slot 0
    assertEq(x, 49, " x must be 49");
   }
}
