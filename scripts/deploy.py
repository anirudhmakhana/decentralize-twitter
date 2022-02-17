from brownie import accounts, config, TwitterAccount, network
import time


def deploy_twitter_account():
    account = get_account()
    twitter_account = TwitterAccount.deploy({"from": account})
    # getLatestTweet = twitter_account.isAdmin()
    makeATweet = twitter_account.tweetAtMe(
        "Hello, this is test tweet", {"from": account}
    )
    time.sleep(1)
    print(makeATweet)


def get_account():
    if network.show_active() == "development":
        return accounts[0]
    else:
        return accounts.add(config["wallets"]["from_key"])


def main():
    deploy_twitter_account()
