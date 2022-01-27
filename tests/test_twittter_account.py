from brownie import TwitterAccount, accounts


def test_deploy():
    # Arrange
    account = accounts[0]
    # Act
    sample_twitter_account = TwitterAccount.deploy({"from": account})
    starting_value = sample_twitter_account.isAdmin()
    expected = True
    # Assert
    assert starting_value == expected


def test_tweet():
    ##Arrange
    account = accounts[0]
    sample_tweet = TwitterAccount.deploy({"from": account})
    ##Act
    expected = ("Hi, this is a test tweet", sample_tweet.timeCall(), 1)
    txn = sample_tweet.tweet("Hi, this is a test tweet", {"from": account})
    txn.wait(1)
    ##assert
    assert expected == sample_tweet.getLatestTweet()
