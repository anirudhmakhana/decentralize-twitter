// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract TwitterAccount {
    address public me;

    mapping(address => uint256) public numOfTweets;
    mapping(address => uint256) public lastTweetedAt;

    // constructor
    constructor() {
        me = msg.sender;
    }

    event NewTweet(address indexed from, uint256 timestamp, string message);

    // create new tweet
    function tweetAtMe(string calldata _message) external {
        require(
            lastTweetedAt[msg.sender] + 15 minutes < block.timestamp,
            "Must wait 15 minutes before waving again."
        );

        // Update the `waves` mapping
        numOfTweets[msg.sender] += 1;
        lastTweetedAt[msg.sender] = block.timestamp;

        // Emit the `Tweet` event.
        emit NewTweet(msg.sender, block.timestamp, _message);
    }
}
