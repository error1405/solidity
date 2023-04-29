// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
// Importing Library From Root Directory
import "../que9_lib.sol";

contract myContract {  

    function Highest(uint _a, uint _b) public pure returns (uint) {
        return addition.highFunc(_a,_b);
    }

    function Lowest(uint _a, uint _b) public pure returns (uint) {
        return addition.lowFunc(_a,_b);
    }

}
