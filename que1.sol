// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract que1 {
    uint256 numVal;

    constructor() {
        numVal = 0;
    }

    function storeVal(uint256 _numVal) public {
        numVal = _numVal;
    }

    function retriveVal() public view returns (uint) {
        return numVal;
    }
}
