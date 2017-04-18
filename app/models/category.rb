class Category < ApplicationRecord
  has_many :book_categories
  has_many :books, through: :book_categories

  enum classification: [:fiction, :non_fiction]
  
  validates :name, :classification, presence: true
  validates :name, uniqueness: true

  scope :fiction, -> {where(classification: "fiction")}
  scope :non_fiction, -> {where(classification: "non_fiction")}
end
