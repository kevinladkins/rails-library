class Author < ActiveRecord::Base

has_many :books
has_many :author_classifications
has_many :classifications, through: :author_classifications

end
