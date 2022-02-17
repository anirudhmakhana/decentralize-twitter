from textwrap import TextWrapper
from brownie import TwitterAccount, accounts, config


def read_isAdmin():
    ##get the latest deployement from the rinkeby network.
    simple_tweet = TwitterAccount[-1]
    print(simple_tweet.isAdmin())


def main():
    read_isAdmin()
