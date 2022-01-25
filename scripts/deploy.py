from brownie import accounts, config, TwitterAccount, network


def deploy_twitter_account():
    account = get_account()
    twitter_account = TwitterAccount.deploy({"from": account})
    stored_value = twitter_account.tweet("Hello, this is a test tweet")
    print(stored_value)
    # transaction = twitter_account.store(15, {"from": account})
    # transaction.wait(1)
    # updated_stored_value = twitter_account.retrieve()
    # print(updated_stored_value)


def get_account():
    if network.show_active() == "development":
        return accounts[0]
    else:
        return accounts.add(config["wallets"]["from_key"])


def main():
    deploy_twitter_account()
