// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts/utils/Context.sol";
import "./ERC3525.sol";

contract ERC3525Mintable is Context, ERC3525 {

    mapping(uint256 => uint256) private _slotTotalSupply;

    function initialize(
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) public virtual initializer {
        __ERC3525Mintable_init(name_, symbol_, decimals_);
    }

    // solhint-disable-next-line func-name-mixedcase
    function __ERC3525Mintable_init(
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) internal onlyInitializing{
        __ERC3525_init_unchained(name_, symbol_, decimals_);
    }

    // solhint-disable-next-line func-name-mixedcase
    function __ERC3525Mintable_init_unchained() internal onlyInitializing {
        // solhint-disable-previous-line no-empty-blocks
    }

    function slotTotalSupply(uint256 slot_) public virtual view returns(uint256) {
        return _slotTotalSupply[slot_];
    }

    function mint(address mintTo_, uint256 tokenId_, uint256 slot_, uint256 value_) public virtual {
        ERC3525._mint(mintTo_, tokenId_, slot_, value_);
        _incrementTotalSupply(tokenId_, value_);
    }

    function mintValue(uint256 tokenId_, uint256 value_) public virtual {
        ERC3525._mintValue(tokenId_, value_);
        _incrementTotalSupply(tokenId_, value_);
    }

    function _incrementTotalSupply(uint256 tokenId_, uint256 value_) internal {
        _slotTotalSupply[slotOf(tokenId_)] += value_;
    }

    function _decrementTotalSupply(uint256 tokenId_, uint256 value_) internal {
        _slotTotalSupply[slotOf(tokenId_)] -= value_;
    }
}
