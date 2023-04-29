// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract que7 {

    address owner;
    uint price;
    uint c;

    constructor() {
        owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
        price = 0;
    }

    // Using Function Modifier Only Owner Can Change Prices
    modifier ownerOnly()
    {
        require(msg.sender == owner);
        _;          //Only Excute Function If Require Is FullFilled
    }

    // Applying Modifier To Set Function
    function setPrice(uint _price) public ownerOnly() {
        price = _price;
    }

    function getPrice() public view  returns (uint) {
        return price;
    }

    /* *** Another Example *** */

    function addFunc(uint _a, uint _b) public adds(_a , _b) returns (uint _c){
        return c;
    }

    modifier adds(uint _a, uint _b)
    {
        c = _a+_b;
        _;
    }

}