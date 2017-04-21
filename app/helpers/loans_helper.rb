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
	
end
