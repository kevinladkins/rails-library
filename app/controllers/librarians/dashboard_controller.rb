class Librarians::DashboardController < ApplicationController

before_action :authorize_user

  def index
    @loans = Loan.all
    @user = User.first
    @book = Book.first
  end

end
