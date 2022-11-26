// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @notice Interface for the optional slot metadata functions
 */
interface IERC3525SlotMetadata {

    struct SlotMetadata {
        string name;
        string symbol;
        uint8 decimals;
    }

    /**
     * @dev Returns the name of the slot.
     */
    function slotName(uint256 slot_) external view returns (string memory);

    /**
     * @dev Returns the symbol of the slot.
     */
    function slotSymbol(uint256 slot_) external view returns (string memory);

    /**
     * @dev Returns the decimals places of the slot.
     */
    function slotDecimals(uint256 slot_) external view returns (uint8);
}
