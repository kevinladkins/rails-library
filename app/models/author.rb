class Author < ActiveRecord::Base

has_many :books

validates :name, :born, presence: :true

extend Searchable::ClassMethods


end
