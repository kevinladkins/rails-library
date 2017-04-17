class Book < ApplicationRecord
  belongs_to :author
  has_many :loans
  has_many :borrowers, :through => :loans, :source => :patron
  has_many :book_categories
  has_many :categories, through: :book_categories

  accepts_nested_attributes_for :author, :reject_if => proc {|attributes| attributes['name'].blank?}

  validates :copies, :title, presence: true
  validates :copies, numericality: {greater_than: 0}


  enum status: [:available, :checked_out]
  enum classification: [:fiction, :non_fiction]

  scope :fiction, -> {where(classifciation: "fiction")}
  scope :non_fiction, -> {where(classification: "non_fiction")}

  before_create :set_available_copies


  def self.search(query)
    if query.present?
      search = where('title like ?', "%#{query}")
      search.empty? ? self.all : search
    else
      self.all
    end
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

  def check_availability
    available_copies > 0 ? status = "available" : status = "checked_out"
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
