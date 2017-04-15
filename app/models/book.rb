class Book < ApplicationRecord
  belongs_to :author
  belongs_to :classification
  has_many :loans
  has_many :borrowers, :through => :loans, :source => :patron


  enum status: [:available, :checked_out]
end
