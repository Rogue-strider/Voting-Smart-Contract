# Voting Smart Contract

This is a Solidity-based Voting Smart Contract designed for a decentralized voting system on the Ethereum blockchain. It allows for voter and candidate registration, voting, and result declaration, with controls for the election commission to manage the process securely.

## Features

- **Voter Registration**: Voters can register with their name, age, and gender, provided they are 18 or older.
- **Candidate Registration**: Candidates can register with their name, party, age, and gender, limited to a maximum of two candidates.
- **Voting**: Registered voters can cast a vote for a candidate during the voting period.
- **Election Management**: The election commission can set the voting start time and duration, stop voting in emergencies, and declare the winner.
- **Security Checks**:
  - Ensures voters and candidates are unique.
  - Restricts voting to the defined time period.
  - Prevents double voting.
  - Only the election commission can perform critical actions like setting voting times or declaring results.
- **Transparency**: Public functions to view candidate and voter lists, as well as the current voting status.

## Contract Details

- **Solidity Version**: `>=0.5.0 <0.9.0`
- **License**: MIT
- **Main Components**:
  - `Voter` struct: Stores voter details (name, age, voter ID, gender, vote cast, and address).
  - `Candidate` struct: Stores candidate details (name, party, age, gender, candidate ID, address, and vote count).
  - `electionCommission`: The address of the contract deployer, who has special privileges.
  - `stopVoting`: A boolean flag for emergency voting termination.
  - Mappings for voter and candidate details, indexed by IDs.
  - Modifiers for access control (`onlyCommissioner`, `isVotingOver`).

## Key Functions

### Voter Functions
- `voterRegister(string _name, uint _age, string _gender)`: Registers a voter if they are 18+ and not already registered.
- `voterList()`: Returns an array of all registered voters.
- `vote(uint _voterId, uint _candidateId)`: Allows a voter to cast a vote for a candidate, with checks for validity and voting period.

### Candidate Functions
- `CandidateRegister(string _name, string _party, uint _age, string _gender)`: Registers a candidate if they are 18+, not already registered, and the candidate limit (2) is not reached.
- `candidateList()`: Returns an array of all registered candidates.

### Election Commission Functions
- `voteTime(uint _startTime, uint duration)`: Sets the voting start time and duration.
- `emergency()`: Stops voting in case of an emergency.
- `result()`: Declares the winner based on the highest vote count.

### Utility Functions
- `votingStatus()`: Returns the current status of the election ("Voting has not started", "Voting is going on", or "Voting has ended").
- `candidateVerification(address _person)`: Checks if a candidate is not already registered.
- `voterVerification(address _person)`: Checks if a voter is not already registered.

## Setup and Deployment

1. **Prerequisites**:
   - Install a Solidity development environment (e.g., Remix, Hardhat, or Truffle).
   - Use a compatible Ethereum wallet (e.g., MetaMask) for deployment and interaction.

2. **Deployment**:
   - Deploy the contract using an Ethereum account that will act as the `electionCommission`.
   - Ensure the Solidity compiler version is between `0.5.0` and `0.8.9`.

3. **Usage**:
   - The election commission sets the voting period using `voteTime`.
   - Candidates register using `CandidateRegister`.
   - Voters register using `voterRegister`.
   - Voters cast votes using `vote`.
   - The election commission can check the status with `votingStatus`, stop voting with `emergency`, or declare the winner with `result`.

## Example Workflow

1. Deploy the contract (deployer becomes `electionCommission`).
2. Register two candidates using `CandidateRegister`.
3. Register voters using `voterRegister`.
4. Set the voting period with `voteTime`.
5. Voters cast their votes using `vote`.
6. After the voting period, the election commission calls `result` to determine the winner.
7. In an emergency, call `emergency` to halt voting.

## Security Considerations

- The contract enforces a maximum of two candidates to keep the system simple.
- Only the election commission can perform sensitive operations (e.g., setting voting time, declaring results).
- Checks prevent double voting and ensure only registered voters and candidates participate.
- The `emergency` function allows the commission to stop voting if needed.

## Limitations

- Limited to two candidates for simplicity.
- No mechanism to reset or reuse the contract for a new election.
- Assumes the election commission is a trusted entity.

## Testing

- Use Remix IDE or Hardhat for testing on a local blockchain.
- Test cases should include:
  - Registering voters and candidates.
  - Attempting to vote before/after the voting period.
  - Attempting to vote twice or with an invalid ID.
  - Emergency stop and result declaration.

## Contributing

Feel free to fork this repository, create pull requests, or report issues for improvements or bug fixes.

## SOON WILL UPLOAD ITS FRONTENT PART WITH THIS SOLDITY CODE INTEGRATION. Happy Coding🚀💫
