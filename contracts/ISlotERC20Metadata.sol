// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @notice Interface for the optional slot metadata functions
 */
interface ISlotERC20Metadata {
    /**
     * @dev Returns the name of the slot.
     */
    function slotName() external view returns (string memory);

    /**
     * @dev Returns the symbol of the slot.
     */
    function slotSymbol() external view returns (string memory);

    /**
     * @dev Returns the decimals places of the slot.
     */
    function slotDecimals() external view returns (uint8);
}
