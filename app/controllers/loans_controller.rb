class LoansController < ApplicationController

  def index
    @overdue = Loan.overdue.order(:due_date)
  end

  def create
    loan = current_user.loans.build
    loan.borrow_book(params[:book_id])
    if loan.save
      redirect_to book_path(loan.book)
    else
       redirect_to :back
       flash.alert = "Sorry, this book is not available."
    end
  end

  def show

  end

  def update
  end


  private

  def loan_params
    params.require(:book_id)
  end

end
