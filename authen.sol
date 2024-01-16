 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleAuthentication {
    mapping(address => string) public userEmails;
    
    event UserRegistered(address indexed userAddress, string email);

    function registerUser(string memory email) external {
        require(bytes(userEmails[msg.sender]).length == 0, "User already registered");
        userEmails[msg.sender] = email;
        emit UserRegistered(msg.sender, email);
    }

    function getUserEmail() external view returns (string memory) {
        return userEmails[msg.sender];
    }
}

