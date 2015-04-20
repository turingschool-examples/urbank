class Account < ActiveRecord::Base
  belongs_to :user

  has_many :incoming_transfers, foreign_key: :incoming_id, class_name: 'Transfer'
  has_many :outgoing_transfers, foreign_key: :outgoing_id, class_name: 'Transfer'
end
