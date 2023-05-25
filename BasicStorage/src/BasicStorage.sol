// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

contract BasicStorage {
     uint256 private x = 52; //slot 0
     uint256 private y = 43; //slot 1

    function setX(uint256 newValue) public {
        x = newValue;
    }

    function getX() public view returns (uint256) {
        return x;
}


}
