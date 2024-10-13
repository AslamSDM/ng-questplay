// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Challenge {
    uint256 immutable _SKIP;

    constructor(uint256 skip) {
        _SKIP = skip;
    }

    /**
     * @notice Returns the sum of the elements of the given array, skipping any SKIP value.
     * @param array The array to sum.
     * @return sum The sum of all the elements of the array excluding SKIP.
     */
    function sumAllExceptSkip(
        uint256[] calldata array
    ) public view returns (uint256 sum) {
        uint256 length = array.length;
        for (uint256 i = 0; i < length; ) {
            uint256 value = array[i];
            if (value != _SKIP) {
                require(sum + value >= sum, "Overflow");
                sum = sum + value;
            }
            unchecked {
                i = i + 1;
            }
        }
        return sum;
    }
}
