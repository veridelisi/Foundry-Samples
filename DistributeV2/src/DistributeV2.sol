// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract DistributeV2 {
    /*
        This exercise assumes you know how to sending Ether.
        1. This contract has some ether in it, distribute it equally among the
           array of addresses that is passed as argument.
        2. Write your code in the `distributeEther` function.
        3. Consider scenarios where one of the recipients rejects the ether transfer, 
           have a work around for that whereby other recipients still get their transfer
    */

    constructor() payable {}

     function distributeEther(address[] memory addresses) public {
        uint amount = address(this).balance / (addresses.length);
              for (uint i=0; i < addresses.length; i++){
                  // payable(addresses[i]).transfer(amount);
                  (bool sent,) = payable(addresses[i]).call{value: 0}("");
                    if (sent==true){
                        (bool sent,) = payable(addresses[i]).call{value: amount}("");
                    }
                
              }
    }

   
    receive() external payable {}
}
