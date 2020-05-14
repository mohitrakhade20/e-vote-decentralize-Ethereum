pragma solidity >=0.4.21 <0.7.0;


contract Election {
    //Model a candidate
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }
    //store the account that we are voted
    mapping(address => bool) public voters;

    //Store candidate
    //Fetch Candidate
    mapping(uint256 => Candidate) public candidates;

    //store candidate count
    uint256 public candidatesCount;

    event votedEvent(uint256 indexed _candidateId);

    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint256 _candidateId) public {
        //  double vote problem
        require(!voters[msg.sender]);
        //  validate
        require(_candidateId > 0 && _candidateId <= candidatesCount);
        //  record that voter has voted
        voters[msg.sender] = true;
        //update candidate vote Count
        candidates[_candidateId].voteCount++;
        //trigger voted event
        emit votedEvent(_candidateId);
    }
}
