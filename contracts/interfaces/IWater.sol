//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

interface IWater {
    function lend(uint256 _amount) external returns (bool);

    function repayDebt(uint256 leverage, uint256 debtValue) external;

    function getTotalDebt() external view returns (uint256);

    function updateTotalDebt(uint256 profit) external returns (uint256);

    function totalAssets() external view returns (uint256);

    function totalDebt() external view returns (uint256);

    function balanceOfUSDC() external view returns (uint256);
}
