class Librarians::DashboardController < ApplicationController

  def index
    @loan = Loan.all
    @user = User.first
    @book = Book.first
  end

end
