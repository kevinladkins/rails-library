class Librarians::DashboardController < ApplicationController

  def index
    @loans = Loan.all
    @user = User.first
    @book = Book.first
  end

end
