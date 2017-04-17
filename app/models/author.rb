class Author < ActiveRecord::Base

has_many :books

extend Searchable::ClassMethods


end
