// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

abstract contract Challenge {
    /**
     * @notice Returns a copy of the given array in a gas efficient way.
     * @dev This contract will be called internally.
     * @param array The array to copy.
     * @return copy The copied array.
     */
    function copyArray(
        bytes memory array
    ) internal pure returns (bytes memory copy) {
        assembly {
            let length := mload(array)
            copy := mload(0x40)
            mstore(copy, length)
            let src := add(array, 0x20)
            let dest := add(copy, 0x20)
            // Copy the data
            for {
                let end := add(src, length)
            } lt(src, end) {
                src := add(src, 0x20)
                dest := add(dest, 0x20)
            } {
                mstore(dest, mload(src))
            }
            // Update the free memory pointer
            mstore(0x40, add(dest, 0x20))
        }
    }
}
