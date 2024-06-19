// SPDX-License-Identifier: MIT

// @audit-info Should use the same solidity version for all the files which mateches the Openzeppelin-contracts. Use ^0.8.20
pragma solidity 0.8.20;

import {Governor} from "@openzeppelin/contracts/governance/Governor.sol";
import {GovernorCountingSimple} from "@openzeppelin/contracts/governance/extensions/GovernorCountingSimple.sol";
import {GovernorVotes, IVotes} from "@openzeppelin/contracts/governance/extensions/GovernorVotes.sol";
import {GovernorVotesQuorumFraction} from
    "@openzeppelin/contracts/governance/extensions/GovernorVotesQuorumFraction.sol";

contract VaultGuardianGovernor is Governor, GovernorCountingSimple, GovernorVotes, GovernorVotesQuorumFraction {
    constructor(IVotes _voteToken)
        Governor("VaultGuardianGovernor")
        GovernorVotes(_voteToken)
        GovernorVotesQuorumFraction(4)
    {}

    // @audit-info public should not be used it should be makred as external
    // @audit - medium - incorrect voting period
    function votingDelay() public pure override returns (uint256) {
        return 1 days;
        // return 7200;
    }

    // // @audit-info public should not be used it should be makred as external
    // @audit - medium - incorrect voting period
    function votingPeriod() public pure override returns (uint256) {
        return 7 days;
        // return 50400;
    }

    // The following functions are overrides required by Solidity.

    // // @audit-info public should not be used it should be makred as external
    function quorum(uint256 blockNumber)
        public
        view
        override(Governor, GovernorVotesQuorumFraction)
        returns (uint256)
    {
        return super.quorum(blockNumber);
    }
}

// ✅