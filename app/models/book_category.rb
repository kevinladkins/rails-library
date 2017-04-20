class BookCategory < ApplicationRecord
  
  belongs_to :book
  belongs_to :category
  
  validates: :book_id, :category_id, presence: :true

end
