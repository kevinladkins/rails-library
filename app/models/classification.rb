class Classification < ApplicationRecord
  has_many :books
  has_many :authors, through: :books

  enum category: [:fiction, :non_fiction]
end
