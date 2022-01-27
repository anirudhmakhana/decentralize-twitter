// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract TwitterAccount {
    // data structure of a single tweet
    struct Tweet {
        uint256 timestamp;
        string tweetString;
    }

    // "array" of all tweets of this account: maps the tweet id to the actual tweet
    mapping(uint256 => Tweet) public _tweets;

    // total number of tweets in the above _tweets mapping
    uint256 public _numberOfTweets;

    // "owner" of this account: only admin is allowed to tweet
    address public _adminAddress;

    // constructor
    constructor() {
        _numberOfTweets = 0;
        _adminAddress = msg.sender;
    }

    // returns true if caller of function ("sender") is admin
    function isAdmin() public view returns (bool) {
        return msg.sender == _adminAddress;
    }

    // create new tweet
    function tweet(string memory tweetString) public returns (int256 result) {
        if (!isAdmin()) {
            // only owner is allowed to create tweets for this account
            result = -1;
        } else if (bytes(tweetString).length > 160) {
            // tweet contains more than 160 bytes
            result = -2;
        } else {
            _tweets[_numberOfTweets].timestamp = block.timestamp;
            _tweets[_numberOfTweets].tweetString = tweetString;
            _numberOfTweets++;
            result = 0; // success
        }
    }

    function getTweet(uint256 tweetId)
        public
        view
        returns (string memory tweetString, uint256 timestamp)
    {
        // returns two values
        tweetString = _tweets[tweetId].tweetString;
        timestamp = _tweets[tweetId].timestamp;
    }

    function getLatestTweet()
        public
        view
        returns (
            string memory tweetString,
            uint256 timestamp,
            uint256 numberOfTweets
        )
    {
        // returns three values
        tweetString = _tweets[_numberOfTweets - 1].tweetString;
        timestamp = _tweets[_numberOfTweets - 1].timestamp;
        numberOfTweets = _numberOfTweets;
    }

    function getOwnerAddress() public view returns (address) {
        return _adminAddress;
    }

    function getNumberOfTweets() public view returns (uint256) {
        return _numberOfTweets;
    }

    function timeCall() public view returns (uint256) {
        return block.timestamp;
    }
}
