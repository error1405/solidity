// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract voting{
    address voter1;
    address voter2;
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
    }

    function voteFunc(uint _vote) public chkVoter
    {
        vote[msg.sender] = _vote;
        voted[msg.sender] = true;
    }

    function transferAuth(address _voter) public  chkVoter{
        if(msg.sender == voter1) 
        {
            require(delegation[v1] < 5, "You've Reached Delegation Limit");
            require(voter1!=_voter, "You Already Have Authority To Vote");
            delegation[v1] = delegation[v1]+1;
            voter1 = _voter;
        }
        else if(msg.sender == voter2)
        {
            require(delegation[v2] < 5, "You've Reached Delegation Limit");
            require(voter1!=_voter, "You Already Have Authority To Vote");
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
        require(msg.sender == voter1 || msg.sender == voter2, "You're Not A Voter");
        require(!voted[msg.sender],"You're Already Gave Your Vote");
        _;
    }

    modifier chkVoted
    {
        require(voted[voter1] && voted[voter2],"Both Votes Are Valueable");
        _;
    }
}