class Category < ApplicationRecord

  enum classification: {fiction: 0, non_fiction: 1}

  has_many :book_categories
  has_many :books, through: :book_categories

  validates :name, :classification, presence: true
  validates :name, uniqueness: true


  def self.alphabetical
    self.order(:name)
  end

  def self.next(id)
   ids = self.alphabetical.map {|category| category.id}
   current_index = ids.each_index.select{|i| ids[i] == id}.pop
   self.find(ids[current_index + 1])
  end



end
