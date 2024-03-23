// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Test, console} from "forge-std/Test.sol";


/* Problem 1 Interface & Contract */
contract StudentV1 {
    // Note: You can declare some state variable
    uint256 public callCount = 0;
    function register() external returns (uint256) {
        // This is not a view function, so I just use a state variable
        callCount++;
        return callCount == 1 ? 1001 : 123;
    }
}

/* Problem 2 Interface & Contract */
interface IClassroomV2 {
    function isEnrolled() external view returns (bool);
    function code() external view returns (uint256);
}

contract StudentV2 {
    function register() external view returns (uint256) {
        // Use the msg.sender to check if the student is enrolled
        IClassroomV2 classroom = IClassroomV2(msg.sender);
        return classroom.isEnrolled() ? 123 : 1001;
    }
}

/* Problem 3 Interface & Contract */
contract StudentV3 {
    function register() external view returns (uint256) {
        // This transaction uses gas, so I can take advantage of the gasleft() function
        bytes32 randomBytes = keccak256(abi.encodePacked(blockhash(block.number), gasleft()));
        uint256 randomNumber = uint256(randomBytes);

        return randomNumber % 2 == 0 ? 123 : 2000;
    }
}