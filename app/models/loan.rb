class Loan < ApplicationRecord
  belongs_to :patron, class_name: "User"
  belongs_to :book

  validates :patron_id, :book_id, presence: :true
  before_create :take_book

  enum status: [:on_loan, :returned]

  def borrow_book(book_id)
    if book = Book.find(book_id)
      if book.check_availability == "available"
        self.book = book
        self.checkout_date = DateTime.now
        self.due_date = DateTime.now + 14
      end
    end
  end


  def take_book
    book.update(quantity: book.quantity - 1)
  end


end
