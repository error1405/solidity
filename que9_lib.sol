// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

library addition {
    
    function highFunc(uint _a, uint _b) external  pure returns(uint) {
        return (_a > _b ? _a : _b);
    }
    
    function lowFunc(uint _a, uint _b) external  pure returns(uint) {
        return (_a < _b ? _a : _b);
    }

}