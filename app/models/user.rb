class User < ActiveRecord::Base
  has_many :accounts
  has_one  :account

  def transfers
    account.incoming_transfers + account.outgoing_transfers
  end
end
