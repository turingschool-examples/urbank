class HomeController < ApplicationController
  def show
    session[:user_id] = User.first.id
  end
end
