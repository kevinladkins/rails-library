class LoansController < ApplicationController

  def index
    @loans = Loan.on_loan
  end

  def create
    loan = current_user.loans.build
    loan.borrow_book(loan_params[:book_id])
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
  
  def edit
    @loan = Loan.find(params[:id])
  end

  def update
    loan = Loan.find(params[:id])
    if current_user.librarian? && params[:loan][:due_date]
      loan.update(loan_params)
      flash.alert = "Loan extened until #{loan.due_date.strftime("%A, %B %W %Y")}."
      redirect_to dashboard_index_path
    else
      loan.return_book
      flash.alert = "Book returned."
      redirect_to user_path(current_user)
    end

  end


  private

  def loan_params
    params.require(:loan).permit(:book_id, :due_date)
  end

end
