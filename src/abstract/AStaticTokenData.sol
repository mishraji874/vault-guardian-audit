// SPDX-License-Identifier: MIT

// @audit-info Should use the same solidity version for all the files which mateches the Openzeppelin-contracts. Use ^0.8.20
pragma solidity 0.8.20;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {AStaticUSDCData} from "./AStaticUSDCData.sol";

abstract contract AStaticTokenData is AStaticUSDCData {
    // Intended to be LINK
    IERC20 internal immutable i_tokenTwo;
    string public constant TOKEN_TWO_VAULT_NAME = "Vault Guardian LINK";
    string public constant TOKEN_TWO_VAULT_SYMBOL = "vgLINK";

    constructor(address weth, address tokenOne, address tokenTwo) AStaticUSDCData(weth, tokenOne) {
        i_tokenTwo = IERC20(tokenTwo);
    }

    function getTokenTwo() external view returns (IERC20) {
        return i_tokenTwo;
    }
}

// ✅