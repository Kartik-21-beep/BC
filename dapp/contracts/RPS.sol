// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract RPS {
    string public message = "Hello from Blockchain";

    struct Game {
        uint256 player;
        uint256 computer;
        string winner;
    }

    Game public lastGame;

    function setMessage(string memory newMessage) public {
        message = newMessage;
    }

    function play(uint256 playerMove) public {
        require(playerMove <= 2, "Invalid move");
        
        uint256 computerMove = uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, msg.sender))) % 3;
        
        string memory winner;
        if (playerMove == computerMove) {
            winner = "Tie";
        } else if ((playerMove + 2) % 3 == computerMove) {
            winner = "Player";
        } else {
            winner = "Computer";
        }
        
        lastGame = Game(playerMove, computerMove, winner);
    }

    function getLastGame() public view returns (Game memory) {
        return lastGame;
    }
}
