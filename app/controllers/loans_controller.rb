class LoansController < ApplicationController

  def create
    loan = Loan.new
    loan.book = Book.find(params[:book_id])
    loan.patron = current_user
    loan.checkout_date = DateTime.now
    loan.due_date = DateTime.now + 14
    loan.save
    redirect_back(fallback_location: root_path)
  end


  private

  def loan_params
    params.require(:book_id)
  end

end
