pragma solidity ^0.4.17;

contract Election {
  //Model a candidate
  struct Candidate { //syntactic suger, so no mapping
    uint id;
    string name;
    uint voteCount;
  }
  //Store candidates
  //key uint
  //value candidate structure type
  mapping(uint => Candidate) public candidates;
  //fetch candidates
  //track length of candidates
  uint public candidatesCount; //no way to determine size and iterate
  //constructor

  //store accounts voted
  mapping(address => bool) public voters;

  event votedEvent (
    uint indexed _candidateId
    );

  function Election () public {
    addCandidate("John");
    addCandidate("Sam");
    addCandidate("June");
  }

  function addCandidate(string _name) private {
    candidatesCount++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }

  function vote(uint _candidateId) public {
      //gas used this point won't get refunded
      require(!voters[msg.sender]);
      require(_candidateId > 0 && _candidateId <= candidatesCount);
      //gas won't be used and get refunded.

        //passes in metadata to the function
        //sender account
        voters[msg.sender] = true;

        candidates[_candidateId].voteCount ++;

        votedEvent(_candidateId);

  }

  //web3.eth.account[0]
  //bug free otherwise can only disable a buggy contract.
  //deploy a contract cost gas
  //
}
