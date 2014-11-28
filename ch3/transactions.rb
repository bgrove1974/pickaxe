#!/usr/bin/ruby

# We're modeling an accounting system where every debit has a corresponding credit. We want to be sure
# that no one can break this rule, so we'll make the methods that do the debits and credits private,
# and we'll define our external interface in terms of transactions.

class Account
  attr_accessor :balance
  def initialize(balance)
    @balance = balance  # @balance is the instance variable, balance is the actual amount
  end
end

class Transaction

  def initialize(account_a, account_b)
    @account_a = account_a
    @account_b = account_b
  end

private

  def debit(account, amount)
    account.balance -= amount
  end

  def credit(account, amount)
    account.balance += amount
  end

public

  #...
  def transfer(amount)
    debit(@account_a, amount)
    credit(@account_b, amount)
  end
  #...
end

savings  = Account.new(100)
checking = Account.new(200)

trans = Transaction.new(checking, savings)
trans.transfer(50)


# Allow individual Account objects to compare their cleared balances but to hide those balances from
# the rest of the world:

class Account
  attr_reader :cleared_balance # accessor method 'cleared balance'
  protected   :cleared_balance # but make it protected

  def greater_balance_than?(other)
    @cleared_balance > other.cleared_balance
  end
end
# Because cleared_balance is protected, it's only available within Account objects

