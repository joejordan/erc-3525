// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import { Context } from "@openzeppelin/contracts/utils/Context.sol";
import { ERC3525SlotERC20 } from "./ERC3525SlotERC20.sol";
import { ERC3525Burnable } from "./ERC3525Burnable.sol";
import { ERC3525Mintable } from "./ERC3525Mintable.sol";

/**
 * @notice adds token value burning to SlotERC20
 */
contract ERC3525SlotERC20Burnable is Context, ERC3525SlotERC20, ERC3525Burnable {

    function initialize(
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) public virtual override(ERC3525Burnable, ERC3525SlotERC20) initializer {
        __ERC3525Burnable_init(name_, symbol_, decimals_);
    }

    // solhint-disable-next-line func-name-mixedcase
    function __ERC3525SlotERC20Burnable_init(
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) internal onlyInitializing {
        __ERC3525_init_unchained(name_, symbol_, decimals_);
    }

    // solhint-disable-next-line func-name-mixedcase
    function __ERC3525SlotERC20Burnable_init_unchained() internal onlyInitializing {
        // solhint-disable-previous-line no-empty-blocks
    }

    function burn(uint256 tokenId_) public virtual override {
        uint256 burnedValue = balanceOf(tokenId_);
        super.burn(tokenId_);
        _decrementTotalSupply(tokenId_, burnedValue);
    }

    function burnValue(uint256 tokenId_, uint256 burnValue_) public virtual override {
        super.burnValue(tokenId_, burnValue_);
        _decrementTotalSupply(tokenId_, burnValue_);
    }

    function mint(address mintTo_, uint256 tokenId_, uint256 slot_, uint256 value_) public virtual override(ERC3525SlotERC20, ERC3525Mintable) {
        super.mint(mintTo_, tokenId_, slot_, value_);
    }

    function mintValue(uint256 tokenId_, uint256 value_) public virtual override(ERC3525SlotERC20, ERC3525Mintable) {
        super.mintValue(tokenId_, value_);
    }
}
