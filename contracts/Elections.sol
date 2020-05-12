pragma solidity >=0.4.21 <0.7.0;


contract Election {
    //Model a candidate
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    //Store candidate
    //Fetch Candidate
    mapping(uint256 => Candidate) public candidates;

    //store candidate count
    uint256 public candidatesCount;

    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
}
