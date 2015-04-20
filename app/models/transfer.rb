class Transfer < ActiveRecord::Base
  validates :incoming_id, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :outgoing_id, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :amount,      presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  belongs_to :incoming_account, foreign_key: :incoming_id, class_name: 'Account'
  belongs_to :outgoing_account, foreign_key: :outgoing_id, class_name: 'Account'
end
