// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/BlockNumber.sol";

contract BlockNumberTest is Test {

    BlockNumber public blockNumber;


    function setUp() public {
        blockNumber = new BlockNumber();
    }

    function testCallMe() external {
        //We call function
        blockNumber.callMe();
        //Emit block number
        emit log_named_uint("First block number", block.number);
        //We take address
        address lastCaller = blockNumber.lastCaller();
        //AssertEq
        assertEq(
            lastCaller,
            address(this),
            "expected last caller to be address(this)"
        );

        //emit types for address
        emit log_address(lastCaller);
        emit log_address(address(this));
        emit log_named_address("Last Caller Address is", lastCaller);
        emit log_named_address("Contract Address is",address(this));
       
        vm.expectRevert();

        //This gives the error
        blockNumber.callMe();

        //This sets the block number
        vm.roll(block.number+1);
        emit log_named_uint("Second block number",block.number);

       


        vm.prank(address(0xDEAD));

        blockNumber.callMe();
        lastCaller = blockNumber.lastCaller();
        assertEq(
            lastCaller,
            address(0xDEAD),
            "expected last caller to be address(0xDEAD)"
        );

        //emit types for address
        emit log_address(lastCaller);
        emit log_address(address(0xDEAD));
        emit log_named_address("Last Caller Address is", lastCaller);
        emit log_named_address("0xDEAD Address is",address(0xDEAD));
    }
}
