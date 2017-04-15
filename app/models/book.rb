class Book < ApplicationRecord
  belongs_to :author
  has_many :loans
  has_many :borrowers, :through => :loans, :source => :patron
  has_many :book_classifications
  has_many :classifications, through: :book_classifications

  enum status: [:available, :checked_out]
end
