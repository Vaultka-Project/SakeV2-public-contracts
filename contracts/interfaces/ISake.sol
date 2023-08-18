//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

interface ISake {
    function withdraw(address _to, uint256 amountToWithdrawInVLP) external returns (bool status, uint256 usdcAmount);

    function withdrawVesting() external;
}
