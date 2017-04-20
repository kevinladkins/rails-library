class Category < ApplicationRecord
  
  enum classification: {fiction: 0, non_fiction: 1}
  
  has_many :book_categories
  has_many :books, through: :book_categories
  
  validates :name, :classification, presence: true
  validates :name, uniqueness: true

  scope :fiction, -> {where(classification: "fiction")}
  scope :non_fiction, -> {where(classification: "non_fiction")}

end
