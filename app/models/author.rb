class Author < ActiveRecord::Base

  extend Searchable::ClassMethods
  include Namable::InstanceMethods

  has_many :books

  validates :first_name, :last_name, :born, presence: :true
  
  before_create :set_name
  
  
  def birth_date
     born.strftime("%B %d, %Y")
  end
  
  def death_date
    died ? died.strftime("%B %d, %Y") : "Still living"
  end


end
