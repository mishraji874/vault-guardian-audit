// SPDX-License-Identifier: MIT

// @audit-info Should use the same solidity version for all the files which mateches the Openzeppelin-contracts. Use ^0.8.20
pragma solidity 0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit, Nonces} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import {ERC20Votes} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

// @audit - low - if there will be a use of ERC20Permit contract which changes the use of permit of the ERC20 contract, by this the centralization is in risk
contract VaultGuardianToken is ERC20, ERC20Permit, ERC20Votes, Ownable {
    constructor() ERC20("VaultGuardianToken", "VGT") ERC20Permit("VaultGuardianToken") Ownable(msg.sender) {}

    // The following functions are overrides required by Solidity.
    function _update(address from, address to, uint256 value) internal override(ERC20, ERC20Votes) {
        super._update(from, to, value);
    }

    // // @audit-info public should not be used it should be makred as external
    function nonces(address ownerOfNonce) public view override(ERC20Permit, Nonces) returns (uint256) {
        return super.nonces(ownerOfNonce);
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
}

// ✅