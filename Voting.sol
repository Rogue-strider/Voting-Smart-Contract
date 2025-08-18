// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract vote {
    struct voter{
        string name;
        uint age;
        uint voterId;
        string gender;
        uint voteCandidateId; //candidate id to whom voter has voted
        address voterAddress;
    }


    struct Candidate {
        string name;
        string party;
        uint age;
        string gender;
        uint candidateId;
        address candidateAddress;
        uint votes; //no. of votes to candidate
    }

    address electionComission;
    address public winner;

    uint newVoterId = 1; //  Voter id for voter
    uint nextCandidateId = 1; //Candidate ID for candidate

    uint startTime;//start time of election
    uint endTime; //end time of election

    mapping(uint=>voter) voterDetails; //Details of voters
    mapping(uint=>Candidate) candidateDetails;
    bool stopVoting; //This is for an emergency to stop voting

    constructor(){
        electionComission=msg.sender;
    }

    modifier onlyCommissioner(){
        require(msg.sender==electionComission,"You are not a from Election Comission");
        _;
    }

    modifier onlyCommission(){
        _;
    }
    function CandidateRegister(
        string calldata _name,
        string calldata _party,
        uint _age,
        string calldata _gender
    ) external {
        require(_age>=18,"Age is under 18");
        require(candidateVerification(msg.sender),"You have already registered");
        require(nextCandidateId<3,"Candidate registration full");
        candidateDetails[nextCandidateId]=Candidate({
            name:_name,
            party:_party,
            age:_age,
            gender:_gender,
            candidateId:nextCandidateId,
            candidateAddress:msg.sender,
            votes:0
        });
        nextCandidateId++;
    }

    function candidateVerification(address _person) internal view returns (bool) {
        for(uint candidateId=1; candidateId<nextCandidateId; candidateId++){
            if(candidateDetails[candidateId].candidateAddress==_person){
                return false;
            }
        }
        return true;
    }

    function candidateList() public view returns (Candidate[] memory){
        Candidate[] memory listOfCandidate = new Candidate[](nextCandidateId-1);
        for(uint i=1;i<nextCandidateId;i++){
            listOfCandidate[i-1]=candidateDetails[i];//tranfering data from mapping to array
        }
        return listOfCandidate;
    }

    function voterRegister(string calldata _name, uint _age, string calldata _gender) public{

    }

    function voterVerification(address _person) internal view returns (bool){

    }

}

