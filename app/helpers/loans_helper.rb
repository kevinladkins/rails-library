module LoansHelper

  def checked_out_books?(user)
    Loan.checked_out_books(user).any?
	end
	
	def user_checked_out_books(user)
	  Loan.checked_out_books(user)
	end
	
	def on_loan_to(user)
	  on_loan = Loan.on_loan_to(user)
	  on_loan
	end
	
	def overdue_books
	  overdue = Loan.overdue.order(due_date: :desc)
	  overdue
	end
	
	
	def books_by_due_date
	  due_dates = Loan.order(due_date: :desc)
	  due_dates
	end
	
end
