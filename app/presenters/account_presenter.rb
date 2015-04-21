class AccountPresenter
  extend Forwardable

  attr_reader :account

  def_delegators :account, :amount, :created_at

  def initialize(account)
    @account = account
  end

  def owner
    account.user.name
  end
end
