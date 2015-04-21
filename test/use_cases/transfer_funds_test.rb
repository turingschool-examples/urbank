require 'test_helper'

class TransferFundsTest < ActiveSupport::TestCase
  test 'it creates' do
    user_1          = User.create(name: 'DJ')
    transfer_params = { amount: '1212', incoming_id: '3', outgoing_id: '1' }
    transfer        = TransferFunds.create(transfer_params, user_1)

    assert_equal TransferFunds, transfer.class
    assert Transfer.find_by(incoming_id: '3')
  end

  test 'it saves' do
    user_1           = User.create(name: 'DJ')
    user_2           = User.create(name: 'Miriam')
    outgoing_account = Account.create(amount: 1000, user_id: user_1.id)
    incoming_account = Account.create(amount: 1000, user_id: user_2.id)
    transfer_params  = { amount: 500, incoming_id: incoming_account.id, outgoing_id: outgoing_account.id }
    transfer         = TransferFunds.create(transfer_params, user_1)

    assert transfer.save
    assert_equal 500, user_1.account.amount
  end
end
