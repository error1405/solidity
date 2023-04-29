// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract voting{
    address voter1;
    address voter2;
    mapping(address => bool) voted;
    mapping(address => uint256) vote;

    constructor(address _voter1, address _voter2) 
    {
        voter1 = _voter1;
        voter2 = _voter2;
    }

    function voteFunc(uint _vote) public chkVoter
    {
        vote[msg.sender] = _vote;
        voted[msg.sender] = true;
    }

    function resultFunc() public chkVoted view returns (uint result) 
    {
        return ((vote[voter1] + vote[voter2]) / 2);
    } 

    function transferAuth(address _voter) public  chkVoter{
        if(msg.sender == voter1) 
        {
            voter1 = _voter;
        }
        else if(msg.sender == voter2)
        {
            voter2 = _voter;
        }
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