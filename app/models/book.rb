class Book < ApplicationRecord
  belongs_to :author
  has_many :loans
  has_many :borrowers, :through => :loans, :source => :patron
  has_many :book_categories
  has_many :categories, through: :book_categories

  accepts_nested_attributes_for :author, :reject_if => proc {|attributes| attributes['name'].blank?}

  validates :copies, :title, presence: true
  validates :copies, numericality: {greater_than: 0}

  enum classification: [:fiction, :non_fiction]

  scope :fiction, -> {where(classifciation: "fiction")}
  scope :non_fiction, -> {where(classification: "non_fiction")}

  before_create :set_available_copies


  extend Searchable::ClassMethods

  def category_ids=(ids)
    ids.delete("")
    rejected_ids = self.category_ids - ids
    new_ids = ids - self.category_ids
    binding.pry
    rejected_ids.each {|id| self.categories.delete(id)} unless rejected_ids.empty?
    ids.empty? ? self.categories.destroy_all : new_ids.each {|id| self.categories << Category.find(id)}
  end

  def categories_attributes=(categories_attributes)
    name = categories_attributes["0"][:name]
    self.categories.create(name: name, classification: self.classification) unless name.blank?
  end



  def set_available_copies
    amount = self.copies
    self.available_copies = amount
  end

  def add_copies(number)
    self.copies = self.copies + number
    self.set_available_copies
    save
  end

  def available?
    available_copies > 0
  end

  def check_out
    if available_copies == 0
       self.errors.add(:available_copies,  "No copies available")
    else
      update(available_copies: available_copies - 1)
    end
  end

  def check_in
    update(available_copies: available_copies + 1)
  end

  private



end
