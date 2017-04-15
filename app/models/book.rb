class Book < ApplicationRecord
  belongs_to :author
  has_many :loans
  has_many :borrowers, :through => :loans, :source => :patron
  accepts_nested_attributes_for :author, :reject_if => proc {|attributes| attributes['name'].blank?}


  #def author_attributes=(author_hash)
  #    if author = Author.find_by(name: author_hash[:name])
  #      self.author = author
  #    else
  #      self.build_author(author_hash)
  #    end
  #end





  enum status: [:available, :checked_out]
end
