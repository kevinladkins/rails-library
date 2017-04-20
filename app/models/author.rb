class Author < ActiveRecord::Base

  extend Searchable::ClassMethods
  include Namable::InstanceMethods

  has_many :books

  validates :first_name, :last_name, :born, presence: :true
  
  before_create :set_name



	

end
