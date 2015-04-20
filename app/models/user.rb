class User < ActiveRecord::Base
  has_many :accounts

  def account
    accounts.first
  end

  def transfers
    account.incoming_transfers + account.outgoing_transfers
  end
end
