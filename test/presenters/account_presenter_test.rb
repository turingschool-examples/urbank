require 'test_helper'

class AccountPresenterTest < ActiveSupport::TestCase
  test 'it has an owner' do
    user              = User.create(name: 'Arya')
    account           = Account.create(amount: 500, user_id: user.id)
    account_presenter = AccountPresenter.new(account)

    assert_equal 'Arya', account_presenter.owner
  end
end
