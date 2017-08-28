class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :synopsis, :available_copies, :publication_year, :classification, :copies, :alpha_title
  belongs_to :author
  has_many :categories, through: :book_categories

end
