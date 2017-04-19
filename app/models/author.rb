class Author < ActiveRecord::Base

has_many :books

validates :first_name, :last_name, :born, presence: :true

before_create :set_name

extend Searchable::ClassMethods
include Namable::InstanceMethods

	

end
