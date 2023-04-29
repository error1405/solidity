// SPDX-License-Identifier: MIT
pragma solidity >=0.8.8;

contract A{

    bool public checker=false;
    function funC() public {
        checker=true;
    }

}

contract B{

    bool public checker=false;
    
    function funC(address _contract) public returns (bytes memory _data) {
        (bool success, bytes memory data) = _contract.delegatecall(abi.encodeWithSignature("funC()"));
        if(success)
        {
            return data;
        }
    }

}