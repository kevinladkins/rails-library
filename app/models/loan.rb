class Loan < ApplicationRecord
  belongs_to :patron, class_name: "User"
  belongs_to :book

  validates :patron_id, :book_id, presence: :true
  validate :book_is_available, unless: :persisted?
  before_create :take_book


  def book_is_available
    if !self.book.available?
      errors.add(:book_id, "This book is not currently available")
    end
  end

  def take_book
    book.update(quantity: book.quantity - 1)
  end


end
