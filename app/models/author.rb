class Author < ActiveRecord::Base

has_many :books

validates :first_name, :last_name, :born, presence: :true

before_create :set_name

extend Searchable::ClassMethods

	def alphabetized_name
	  self.last_name + ", " + self.first_name
	end
  

	def set_name
	  self.name = self.first_name + " " + self.last_name
	end


end
