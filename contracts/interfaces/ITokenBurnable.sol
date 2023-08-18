pragma solidity 0.8.18;
// SPDX-License-Identifier: MIT

interface ITokenBurnable {
    function burn(address account, uint256 amount) external;
    function burnFrom(address account, uint256 amount) external;
}