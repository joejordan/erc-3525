// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import { Context } from "@openzeppelin/contracts/utils/Context.sol";
import { ERC3525Mintable } from "./ERC3525Mintable.sol";
import { ERC3525SlotEnumerable } from "./ERC3525SlotEnumerable.sol";
import { IERC3525SlotMetadata } from "./IERC3525SlotMetadata.sol";

/**
 * @notice adds per-slot naming and decimal functionality
 */
abstract contract ERC3525SlotMetadata is IERC3525SlotMetadata {

    // slotId => slot metadata
    mapping(uint256 => SlotMetadata) public slotMetadata;
    // slotId => slot initialized
    mapping(uint256 => bool) private _slotInitialized;

    function initializeSlotMetadata (
        uint256 slot_,
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) public virtual {
        require(_slotInitialized[slot_], "ERC3525SlotMetadata: Slot is already initialized");
        slotMetadata[slot_] = SlotMetadata({name: name_, symbol: symbol_, decimals: decimals_});
        _slotInitialized[slot_] = true;
    }

    function slotName(uint256 slot_) public virtual view returns (string memory) {
        return slotMetadata[slot_].name;
    }

    function slotSymbol(uint256 slot_) public virtual view returns (string memory) {
        return slotMetadata[slot_].symbol;
    }

    function slotDecimals(uint256 slot_) public virtual view returns (uint8) {
        return slotMetadata[slot_].decimals;
    }

}
