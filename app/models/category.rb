class Category < ApplicationRecord

  enum classification: {fiction: 0, non_fiction: 1}

  has_many :book_categories
  has_many :books, through: :book_categories

  validates :name, :classification, presence: true
  validates :name, uniqueness: true

  def self.next(id)
    a = id +1
    b = self.last.id
    for i in a..b
      if self.find_by(id: i) then
        return self.find(i)
      end
    end
    self.first
  end



end
