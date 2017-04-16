class Book < ApplicationRecord
  belongs_to :author
  has_many :loans
  has_many :borrowers, :through => :loans, :source => :patron
  accepts_nested_attributes_for :author, :reject_if => proc {|attributes| attributes['name'].blank?}

  validates :quantity, :title, presence: true
  validates :quantity, numericality: {greater_than: 0}, unless: :persisted?

  enum status: [:available, :checked_out]
  after_update :check_availability

  def check_availability
    quantity > 0 ? status = "available" : status = "checked_out"
  end

end
