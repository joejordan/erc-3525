// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import { Context } from "@openzeppelin/contracts/utils/Context.sol";
import { ERC3525Mintable } from "./ERC3525Mintable.sol";
import { ERC3525SlotEnumerable } from "./ERC3525SlotEnumerable.sol";

/**
 * @notice adds per-slot naming and decimal functionality
 */
contract ERC3525SlotERC20 is Context, ERC3525Mintable {

    struct SlotERC20 {
        string name;
        string symbol;
        uint8 decimals;
        uint256 totalSupply;
    }

    mapping(uint256 => SlotERC20) public erc20slots;
    mapping(uint256 => bool) private _slotInitialized;

    function initialize(
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) public virtual override(ERC3525Mintable) initializer {
        __ERC3525Mintable_init(name_, symbol_, decimals_);
    }
    function initializeSlot (
        uint256 slot_,
        string memory name_,
        string memory symbol_,
        uint8 decimals_
        // uint256 totalSupply_
    ) public virtual {
        require(_slotInitialized[slot_], "ERC3525SlotERC20: Slot is already initialized");
        erc20slots[slot_] = SlotERC20({name: name_, symbol: symbol_, decimals: decimals_, totalSupply: 0});
        _slotInitialized[slot_] = true;
    }

    // solhint-disable-next-line func-name-mixedcase
    function __ERC3525SlotERC20_init(
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) internal onlyInitializing {
        __ERC3525_init_unchained(name_, symbol_, decimals_);
    }

    // solhint-disable-next-line func-name-mixedcase
    function __ERC3525SlotERC20_init_unchained() internal onlyInitializing {
        // solhint-disable-previous-line no-empty-blocks
    }

    function slotName(uint256 slot_) public virtual view returns (string memory) {
        return erc20slots[slot_].name;
    }

    function slotSymbol(uint256 slot_) public virtual view returns (string memory) {
        return erc20slots[slot_].symbol;
    }

    function slotDecimals(uint256 slot_) public virtual view returns (uint8) {
        return erc20slots[slot_].decimals;
    }

    function slotTotalSupply(uint256 slot_) public virtual view returns (uint256) {
        return erc20slots[slot_].totalSupply;
    }

    function mint(address mintTo_, uint256 tokenId_, uint256 slot_, uint256 value_) public override {
        super.mint(mintTo_, tokenId_, slot_, value_);
        _incrementTotalSupply(tokenId_, value_);
    }

    function mintValue(uint256 tokenId_, uint256 value_) public override {
        require(value_ > 0, "Mint value must be greater than 0");
        // mint value to token id; reverts if tokenId has not yet been minted
        super.mintValue(tokenId_, value_);
        // increment totalSupply of slot
        _incrementTotalSupply(tokenId_, value_);
    }

    function _incrementTotalSupply(uint256 tokenId_, uint256 value_) internal {
        erc20slots[slotOf(tokenId_)].totalSupply += value_;
    }

    function _decrementTotalSupply(uint256 tokenId_, uint256 value_) internal {
        erc20slots[slotOf(tokenId_)].totalSupply -= value_;
    }

}
