// SPDX-License-Identifier: MIT

// @audit-info Should use the same solidity version for all the files which mateches the Openzeppelin-contracts. Use ^0.8.20
pragma solidity 0.8.20;

// @audit-info Remove the import because it is not used and it will increase the cost of gas
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IInvestableUniverseAdapter {
// function invest(IERC20 token, uint256 amount) external;
// function divest(IERC20 token, uint256 amount) external;
}

// ✅