class Book < ApplicationRecord
  belongs_to :author
  has_many :loans
  has_many :borrowers, :through => :loans, :source => :patron
  has_many :book_categories
  has_many :categories, through: :book_categories

  accepts_nested_attributes_for :author, :reject_if => proc {|attributes| attributes['name'].blank?}

  validates :quantity, :title, presence: true
  validates :quantity, numericality: {greater_than: 0}, unless: :persisted?

  enum status: [:available, :checked_out]
  enum classification: [:fiction, :non_fiction]
  after_update :check_availability

  def self.search(query)
    if query.present?
      search = where('title like ?', "%#{query}")
      search.empty? ? self.all : search
    else
      self.all
    end
  end

  def check_availability
    quantity > 0 ? status = "available" : status = "checked_out"
  end

end
