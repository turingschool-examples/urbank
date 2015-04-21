class AccountsController < ApplicationController
  def show
    @account = AccountPresenter.new(current_user.account)
  end
end
