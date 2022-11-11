// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Context.sol";
import "./ERC3525Mintable.sol";

contract ERC3525Burnable is Context, ERC3525Mintable {

    function initialize(
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) public virtual override initializer {
        __ERC3525Burnable_init(name_, symbol_, decimals_);
    }

    // solhint-disable-next-line func-name-mixedcase
    function __ERC3525Burnable_init(
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) internal onlyInitializing {
        __ERC3525_init_unchained(name_, symbol_, decimals_);
    }

    // solhint-disable-next-line func-name-mixedcase
    function __ERC3525Burnable_init_unchained() internal onlyInitializing {
        // solhint-disable-previous-line no-empty-blocks
    }

    function burn(uint256 tokenId_) public virtual {
        require(_isApprovedOrOwner(_msgSender(), tokenId_), "ERC3525: caller is not token owner nor approved");
        ERC3525._burn(tokenId_);
    }

    function burnValue(uint256 tokenId_, uint256 burnValue_) public virtual {
        require(_isApprovedOrOwner(_msgSender(), tokenId_), "ERC3525: caller is not token owner nor approved");
        ERC3525._burnValue(tokenId_, burnValue_);
    }
}
