pragma solidity ^0.5.16;

import "./interfaces/IRandomHbbft.sol";
import "./interfaces/IValidatorSetHbbft.sol";
import "./upgradeability/UpgradeabilityAdmin.sol";

/// @dev Stores and uppdates a random seed that is used to form a new validator set by the
/// `ValidatorSetHbbft.newValidatorSet` function.
contract RandomHbbft is UpgradeabilityAdmin, IRandomHbbft {

    // =============================================== Storage ========================================================

    // WARNING: since this contract is upgradeable, do not remove
    // existing storage variables and do not change their types!


    /// @dev The current random seed accumulated during RANDAO or another process
    /// (depending on implementation).
    uint256 public currentSeed;


    /// @dev The address of the `ValidatorSetHbbft` contract.
    IValidatorSetHbbft public validatorSetContract;

    // ============================================== Modifiers =======================================================

    /// @dev Ensures the caller is the BlockRewardHbbft contract address.
    modifier onlyBlockReward() {
        require(msg.sender == validatorSetContract.blockRewardContract(), "Must be executed by blockRewardContract.");
        _;
    }

    /// @dev Ensures the `initialize` function was called before.
    modifier onlyInitialized {
        require(isInitialized(), "RandomHbbft must be initialized!");
        _;
    }

    /// @dev Ensures the caller is the SYSTEM_ADDRESS. See https://wiki.parity.io/Validator-Set.html
    modifier onlySystem() {
        require(msg.sender == 0xffffFFFfFFffffffffffffffFfFFFfffFFFfFFfE, "Must be executed by System");
        _;
    }
    // =============================================== Setters ========================================================


    function setCurrentSeed(uint256 _currentSeed)
    external
    onlyInitialized
    onlySystem {
        currentSeed = _currentSeed;
    }

    /// @dev Initializes the contract at network startup.
    /// Can only be called by the constructor of the `InitializerHbbft` contract or owner.
    /// @param _validatorSet The address of the `ValidatorSet` contract.
    function initialize(
        address _validatorSet
    ) external {
        _initialize(_validatorSet);
    }

    // =============================================== Getters ========================================================

    /// @dev Returns a boolean flag indicating if the `initialize` function has been called.
    function isInitialized()
    public
    view
    returns(bool) {
        return validatorSetContract != IValidatorSetHbbft(0);
    }


    // ============================================== Internal ========================================================

    /// @dev Initializes the network parameters. Used by the `initialize` function.
    /// @param _validatorSet The address of the `ValidatorSetHbbft` contract.
    function _initialize(address _validatorSet)
    internal {
        //require(msg.sender == _admin() || block.number == 0, "Must be executed by admin");
        require(!isInitialized(), "initialization can only be done once");
        require(_validatorSet != address(0), "ValidatorSet must not be 0");
        validatorSetContract = IValidatorSetHbbft(_validatorSet);
    }

    /// @dev Returns the current `coinbase` address. Needed mostly for unit tests.
    function _getCoinbase()
    internal
    view
    returns(address) {
        return block.coinbase;
    }
}
