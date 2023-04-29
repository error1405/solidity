// SPDX-License-Identifier: MIT
pragma solidity >=0.8.8;

contract demoFallback
{
    event fallbackCalled (string output ,address user,uint amount,bytes data);

    fallback() external payable {
        emit fallbackCalled("Fallback Called", msg.sender, msg.value, msg.data);
    }
}