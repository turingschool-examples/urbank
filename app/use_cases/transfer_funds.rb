class TransferFunds
  extend Forwardable

  def self.create(params, user)
    self.new(params, user)
  end

  attr_reader :transfer, :user

  def_delegators :transfer, :amount, :id

  def initialize(params, user)
    @transfer = Transfer.create(params)
    @user     = user
  end

  def save
    if transfer.save && user.account.amount >= transfer.amount
      account        = user.account
      account.amount = (account.amount - transfer.amount)
      account.save
    end
  end
end
