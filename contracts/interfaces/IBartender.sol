//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

/**
 * @author Chef Photons, Vaultka Team serving high quality drinks; drink responsibly.
 * Factory and global config params
 */
interface IBartender {
    /// @notice deposit USDC into the Vault
    /// Requirements:
    /// {caller: anyone}.
    /// `_amount` it must be greater than 0.
    ///  user must have approve Bartender contract to spend USDC and allowance must be greater than `_amount`
    /// @param _amount amount in USDC msg.sender want to deposit to take leverage.
    /// @param _receiver recipient of $BARTENDER!.
    function deposit(uint256 _amount, address _receiver) external;

    /// @notice withdraw locked USDC from Vault
    /// Requirements:
    /// {caller: anyone}.
    /// `_amount` it must be greater than 0.
    /// `_amount` it must be less than amountDeposited.
    ///  withdrawal time must exceed numbers of time required to withdraw.
    ///  48 hours leverage must
    /// @param _amount amount in USDC msg.sender want to withdraw.
    /// @param _receiver address to recieve the `amount`.
    function withdraw(uint256 _amount, uint256 id, address _receiver) external;

    /// @notice gety current Id of BARTENDER! that has been minted
    /// @return uint256
    function currentId() external view returns (uint256);

    function getSakeVaultInfo(
        uint256 id
    )
        external
        view
        returns (
            bool isLiquidated,
            // total amount of USDC use to purchase VLP
            uint256 leverage,
            // record total amount of VLP
            uint256 totalAmountOfVLP,
            uint256 totalAmountOfVLPInUSDC,
            // get all deposited without leverage
            uint256 totalAmountOfUSDCWithoutLeverage,
            // store puchase price of VLP
            uint256 purchasePrice,
            // store all users in array
            address[] memory users,
            // store time when the sake vault is created
            uint256 startTime
        );

    function getDepositInfo(
        uint256 id,
        address user
    ) external view returns (uint256 amount, uint256 totalWithdrawn, uint256 shares);

    function getDebtInfo(
        uint256 id
    )
        external
        view
        returns (uint256 newValue, uint256 newDebt, uint256 newRatio, uint256 lastUpdateTime, uint256 previousPrice);

    function sakeVault(uint256 id) external view returns (address);

    function setLiquidated(uint256 id) external returns (address sakeAddress);

    function getFeeStatus() external view returns (address, bool, uint128, uint128);

    function getSakeUsers(uint256 id) external view returns (uint256 totalVLP, address[] memory users);

    function updateDebtAndValueAmount(
        uint256 id,
        bool _state
    ) external returns (uint256 totalDebt, uint256 amountInUSDC, uint256 dvtRatio);

    function checkIsLiquidated(uint256 id) external view returns (bool isLiquidated);
}
