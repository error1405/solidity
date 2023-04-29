// SPDX-License-Identifier: MIT
pragma solidity >=0.8.8;

contract Currency
{
    address minter;
    mapping (address => uint) balAcc;

    constructor() 
    {
        minter = msg.sender;
    }

    // Minting And Adding Into Beneficiery Address
    function mint(address _beneficiery, uint _amt) public  
    {
        require(msg.sender == minter, "Only Minter Can Mint Currency");
        balAcc[_beneficiery] += _amt;
    }

    // Transferring Amount to Beneficiery Address From Current  Adderess
    function transfer(address payable _beneficiery, uint _amt) public {
        require(balAcc[msg.sender] >= _amt, "Insufficient Balance");    
        balAcc[_beneficiery] += _amt;
        balAcc[msg.sender] -= _amt;
    }

    // Checking Balance of Received Address
    function balanceof(address _balOf) public view returns (uint _bal){
        return balAcc[_balOf];
    }

}