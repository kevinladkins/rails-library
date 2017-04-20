class Loan < ApplicationRecord

  enum status: {checked_out: 0, returned: 1}
  
  belongs_to :patron, class_name: "User"
  belongs_to :book

  validates :patron_id, :book_id, presence: :true

  scope :on_loan, -> {where(status: "checked_out")}
  scope :overdue, -> {on_loan.where("due_date < ?", DateTime.now)}

  

  def borrow_book(book_id)
    if book = Book.find(book_id)
      if book.available?
        self.book = book
        self.checkout_date = DateTime.now
        self.due_date = DateTime.now + 14
      end
    end
  end
  
 
  def overdue?
    self.due_date < DateTime.now
  end

  def return_book
    self.update(status: "returned")
  end

  def extend_loan(number_of_days)
    self.due_date = self.due_date + number_of_days.to_i.days
    self.save
  end




end
