class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :synopsis, :available_copies, :publication_year, :classification, :copies

  belongs_to :author
  has_many :loans
  has_many :borrowers, :through => :loans, :source => :patron
  has_many :categories, through: :book_categories


end
