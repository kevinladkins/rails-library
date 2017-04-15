class Classification < ApplicationRecord
  has_many :book_classifications
  has_many :books, through: :book_classifications

  enum category: [:fiction, :non_fiction]
end
