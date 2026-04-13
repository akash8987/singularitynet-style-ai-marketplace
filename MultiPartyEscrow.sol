// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/**
 * @title MultiPartyEscrow
 * @dev Manages payment channels for AI service consumption.
 */
contract MultiPartyEscrow is ReentrancyGuard {
    struct PaymentChannel {
        address sender;
        address recipient;
        uint256 balance;
        uint256 expiration;
    }

    mapping(uint256 => PaymentChannel) public channels;
    uint256 public nextChannelId;

    function openChannel(address _recipient, uint256 _expiration) external payable {
        channels[nextChannelId] = PaymentChannel(msg.sender, _recipient, msg.value, _expiration);
        nextChannelId++;
    }

    /**
     * @dev Recipient claims funds using a signed message from the sender.
     */
    function claim(uint256 _channelId, uint256 _amount, bytes calldata _signature) external nonReentrant {
        PaymentChannel storage c = channels[_channelId];
        require(msg.sender == c.recipient, "Only recipient");
        require(_amount <= c.balance, "Exceeds balance");

        // Verification of signature logic would go here
        
        c.balance -= _amount;
        payable(c.recipient).transfer(_amount);
    }
}
