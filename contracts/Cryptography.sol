pragma solidity ^0.7.3;

import "@openzeppelin/contracts/cryptography/ECDSA.sol";
import "hardhat/console.sol";

contract Cryptography {

    /// the address all signatures need to verify against
    address public owner = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;

    // todo: what does using mean and why are we overriding bytes32?
    using ECDSA for bytes32;

    /// @dev verifies the param "message" is valid
    /// "owner" signs message and submits signature as "sign" in this function
    /// then, anyone can call this function with that signature and the message param.
    /// If anyone tries to call the funcntion with a message different than the one
    /// owner used to sign the message then it will return false.
    function _verify(string calldata message, bytes calldata sign) external view returns (bool) {
        bytes32 b = keccak256(abi.encodePacked(message));
        return b.toEthSignedMessageHash().recover(sign) == owner;
    }
}