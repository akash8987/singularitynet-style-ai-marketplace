// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title Registry
 * @dev Manages the registration of AI services and their providers.
 */
contract Registry is Ownable {
    struct Service {
        address provider;
        string metadataURI; // Link to model specs and API
        uint256 pricePerCall;
        bool active;
    }

    mapping(bytes32 => Service) public services;
    bytes32[] public serviceIds;

    event ServiceRegistered(bytes32 indexed id, address indexed provider);

    constructor() Ownable(msg.sender) {}

    function registerService(bytes32 _id, string calldata _uri, uint256 _price) external {
        require(services[_id].provider == address(0), "ID taken");
        
        services[_id] = Service(msg.sender, _uri, _price, true);
        serviceIds.push(_id);
        
        emit ServiceRegistered(_id, msg.sender);
    }

    function getServiceCount() external view returns (uint256) {
        return serviceIds.length;
    }
}
