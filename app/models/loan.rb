class Loan < ApplicationRecord
  belongs_to :patron, class_name: "User"
  belongs_to :book

  validates :patron_id, :book_id, presence: :true

  scope :on_loan, -> {where(status: "checked_out")}
  scope :overdue, -> {on_loan.where("due_date < ?", DateTime.now)}

  enum status: [:checked_out, :returned]

  def borrow_book(book_id)
    if book = Book.find(book_id)
      if book.check_out
        self.book = book
        checkout_date = DateTime.now
        due_date = DateTime.now + 14
      end
    end
  end




end
