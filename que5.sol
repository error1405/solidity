// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract que2{
    address public voter1;
    address public voter2;
    address public chairman;
    string v1;
    string v2;
    mapping(address => bool) voted;
    mapping(address => uint256) vote;
    mapping(string => uint256) delegation;

    constructor(address _voter1, address _voter2) 
    {
        voter1 = _voter1;
        voter2 = _voter2;
        v1 = "v1";
        v2 = "v2";
        chairman = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
    }

    function voteFunc(uint _vote) public chkVoter
    {
        vote[msg.sender] = _vote;
        voted[msg.sender] = true;
    }

    function transferAuth(address oldVoter, address _voter) public{
        require(msg.sender == chairman, "You're Not Chairman");
        require(oldVoter == voter1 || oldVoter == voter2, "Voter Not Found");

        if(oldVoter == voter1) 
        {
            require(delegation[v1] < 5);
            require(voter1!=_voter);
            delegation[v1] = delegation[v1]+1;
            voter1 = _voter;
        }
        else if(oldVoter == voter2)
        {
            require(delegation[v2] < 5);
            require(voter2!=_voter);
            delegation[v2] = delegation[v2]+1;
            voter2 = _voter;
        } 
    }

    function resultFunc() public chkVoted returns (uint result) 
    {
        if(delegation[v1] > 0 )
        {
            vote[voter1] -= ((vote[voter1] * (delegation[v1]*10))/100);
        }
        if(delegation[v2] > 0)
        {
            vote[voter2] -= ((vote[voter2] * (delegation[v2]*10))/100);
        }
        return (vote[voter1]+vote[voter2]);
    }

    modifier chkVoter
    {
        require(msg.sender == voter1 || msg.sender == voter2);
        require(!voted[msg.sender]);
        _;
    }

    modifier chkVoted
    {
        require(voted[voter1] && voted[voter2]);
        _;
    }
}