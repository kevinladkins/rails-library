class Category < ApplicationRecord

  enum classification: {fiction: 0, non_fiction: 1}

  has_many :book_categories
  has_many :books, through: :book_categories

  validates :name, :classification, presence: true
  validates :name, uniqueness: true


  def self.alphabetical
    alpha = self.order(:name)
  end

  def self.next(id)
   all_ids = self.alphabetical.map {|category| category.id}
   current_index = all_ids.each_index.select {|i| all_ids[i] == id}.pop
   if all_ids[current_index + 1] == nil
     self.find(all_ids[0])
   else
     self.find(all_ids[current_index + 1])
   end
  end



end
