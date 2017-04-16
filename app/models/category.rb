class Category < ApplicationRecord
  has_many :book_categories
  has_many :books, through: :book_categories

  enum classification: [:fiction, :non_fiction]

  scope :fiction, -> {where(status: "fiction")}
  scope :non_fiction, -> {where(status: "non_fiction")}
end
