class Classification < ApplicationRecord
  has_many :books
  has_many :author_classifications
  has_many :authors, through: :author_classifications

  enum category: [:fiction, :non_fiction]
end
