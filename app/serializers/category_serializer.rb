class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :books, through: :book_categories, serializer: CategoryBookSerializer

  def books
   object.books.order(:title)
  end
end
