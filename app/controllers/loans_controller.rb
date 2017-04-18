class LoansController < ApplicationController

  def index
    @overdue = Loan.overdue.order(:due_date)
  end

  def create
    loan = current_user.loans.build
    loan.borrow_book(params[:book_id])
    if loan.save
      flash.alert = "Checkout successful."
      redirect_to user_path(current_user)
    else
       redirect_to :back
       flash.alert = "Sorry, this book is not available."
    end
  end

  def show

  end

  def update
    loan = Loan.find(params[:id])
    if params[:extend]
      loan.extend_loan(params[:extend])
      flash.alert = "Loan extened until #{loan.due_date.strftime("%A, %B %W %Y")}."
      redirect_to :back
    else
      loan.return_book
      flash.alert = "Book returned."
      redirect_to user_path(current_user)
    end

  end


  private

  def loan_params
    params.require(:book_id)
  end

end
