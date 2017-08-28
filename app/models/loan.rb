class Loan < ApplicationRecord

  enum status: {checked_out: 0, returned: 1}

  belongs_to :patron, class_name: "User"
  belongs_to :book

  validates :patron_id, :book_id, presence: :true

  scope :on_loan, -> {where(status: "checked_out")}
  scope :overdue, -> {on_loan.where("due_date < ?", DateTime.now)}


   ## borrow/return/extend ##

  def borrow_book(book_id)
    if book = Book.find(book_id)
      if book.available?
        self.book = book
        self.checkout_date = DateTime.now
        self.due_date = DateTime.now + 14
      end
    end
  end

   def return_book
    self.update(status: "returned")
  end

  def extend_loan(number_of_days)
    self.due_date = self.due_date + number_of_days.to_i.days
    self.save
  end


  ## display dates ##

	 def show_due_date
		 due_date.strftime("%A, %B %d %Y")
	 end

	 def show_checkout_date
		 checkout_date.strftime("%B %W, %Y")
	 end


  ## loan status ##

  def self.total_on_loan
    on_loan.count(:book_id)
  end

  def self.total_overdue
    overdue.count(:book_id)
  end

	def overdue?
	  due_date < DateTime.now
	end



  ## patron stats ##


  def self.number_of_loans(patron)
	  checked_out_books(patron).size
	end

	def self.on_loan_to(patron)
	  on_loan.where(patron_id: patron.id)
	end

  def self.checked_out_books(patron)
	  patron_loans = includes(:patron).where(patron_id: patron.id)
	  patron_loans.checked_out.map {|l| l.book}
	end





end
