// SPDX-License-Identifier: MIT

// @audit-info Should use the same solidity version for all the files which mateches the Openzeppelin-contracts. Use ^0.8.20
pragma solidity 0.8.20;

interface IVaultData {
    struct AllocationData {
        uint256 holdAllocation; // hold
        uint256 uniswapAllocation; // Simmilar to T-Swap
        uint256 aaveAllocation; // Similar to Thunder Loan
    }
}

// ✅