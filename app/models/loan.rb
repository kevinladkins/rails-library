class Loan < ApplicationRecord
  belongs_to :patron, class_name: "User"
  belongs_to :book

  validates :patron_id, :book_id, presence: :true
  before_create :take_book

  scope :on_loan, -> {where(status: "checked_out")}
  scope :overdue, -> {on_loan.where("due_date < ?", DateTime.now)}

  enum status: [:checked_out, :returned]

  def borrow_book(book_id)
    if book = Book.find(book_id)
      if book.check_availability == "available"
        self.book = book
        checkout_date = DateTime.now
        due_date = DateTime.now + 14
      end
    end
  end


  def take_book
    book.update(available_copies: book.available_copies - 1)
  end


end
