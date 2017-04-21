class Book < ApplicationRecord

  extend Searchable::ClassMethods
  
  enum classification: {fiction: 0, non_fiction: 1}
  
  belongs_to :author
  has_many :loans
  has_many :borrowers, :through => :loans, :source => :patron
  has_many :book_categories
  has_many :categories, through: :book_categories

  validates :copies, :title, :classification, :author, presence: true
  validates :copies, numericality: {greater_than: 0}

  
  ## attribute builders ##
  
  def author_attributes=(author_attributes)
    self.build_author(author_attributes) unless author_attributes[:last_name].blank?
  end

  def category_ids=(ids)
    ids.delete("")
    rejected_ids = self.category_ids - ids
    new_ids = ids - self.category_ids
    rejected_ids.each {|id| self.categories.delete(id)} unless rejected_ids.empty?
    ids.empty? ? self.categories.destroy_all : new_ids.each {|id| self.categories << Category.find(id)}
  end

  def categories_attributes=(categories_attributes)
    name = categories_attributes["0"][:name]
    self.categories.build(name: name, classification: self.classification) unless name.blank?
  end
  
  ## most_borrowed ##
  
  def self.most_borrowed
    joins(:loans).group("loans.book_id").order("count (*) desc").limit(5)
  end
  
  ## availability status ##
  
  def available?
    available_copies > 0
  end
  
  def available_copies
    self.copies - self.checked_out_copies 
  end
  
  def checked_out_copies
    self.loans.checked_out.count(:book_id)
  end

  def add_copies(new_copies)
    self.copies = self.copies + new_copies
  end

  def check_out
     self.errors.add(:available_copies,  "No copies available") unless available?
  end

end
