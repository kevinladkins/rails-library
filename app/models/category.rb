class Category < ApplicationRecord
  has_many :book_categories
  has_many :books, through: :book_categories

  enum classification: [:fiction, :non_fiction]
end
