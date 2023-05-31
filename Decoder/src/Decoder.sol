// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Decoder {

    function decodeData( bytes memory _data) public pure returns (string memory x , uint256 y) {
    (x, y) = abi.decode(_data, (string, uint256));
    
    }
}

