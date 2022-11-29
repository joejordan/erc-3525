// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Context.sol";
import "../ERC3525SlotApprovable.sol";
import "../ERC3525SlotMetadata.sol";

contract ERC3525AllRoundMock is Context, ERC3525SlotApprovable, ERC3525SlotMetadata {

    constructor(string memory name_, string memory symbol_, uint8 decimals_) ERC3525SlotApprovable() {
        // solhint-disable-previous-line no-empty-blocks
    }

    function mint(
        address mintTo_,
        uint256 tokenId_,
        uint256 slot_,
        uint256 value_
    ) public virtual {
        ERC3525._mint(mintTo_, tokenId_, slot_, value_);
    }

    function mintValue(
        uint256 tokenId_,
        uint256 value_
    ) public virtual {
        ERC3525._mintValue(tokenId_, value_);
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