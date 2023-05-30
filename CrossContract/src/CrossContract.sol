// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract CrossContract {
    /**
     * The function below is to call the price function of PriceOracle1 and PriceOracle2 contracts below and return the lower of the two prices
     */

    function getLowerPrice(
        address _priceOracle1,
        address _priceOracle2
    ) external view returns (uint256) {
    
      //Call variable
      if(PriceOracle1(_priceOracle1)._price() < PriceOracle2(_priceOracle2)._price()){
            return PriceOracle1(_priceOracle1)._price();
        }
        else {
         return PriceOracle2(_priceOracle2)._price();
        }
        
        /**
         //Call function
         
         if(PriceOracle1(_priceOracle1).price() < PriceOracle2(_priceOracle2).price()){
            return PriceOracle1(_priceOracle1).price();
        }
        else {
         return PriceOracle2(_priceOracle2).price();
        }
        
         */
        
        
    }
}

contract PriceOracle1 {
    uint256 private _price;

    function setPrice(uint256 newPrice) public {
        _price = newPrice;
    }

    function price() external view returns (uint256) {
        return _price;
    }
}

contract PriceOracle2 {
    uint256 private _price;

    function setPrice(uint256 newPrice) public {
        _price = newPrice;
    }

    function price() external view returns (uint256) {
        return _price;
    }
}
