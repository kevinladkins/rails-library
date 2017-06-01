class User < ApplicationRecord

  extend Searchable::ClassMethods
  include Namable::InstanceMethods

  has_secure_password
  
  enum role: {patron: 0, librarian: 1}
  
  has_many :loans, :foreign_key => "patron_id"
  has_many :borrowed_books, :through => :loans , :source => :book

  validates :first_name, :last_name, :email, :role, presence: :true
  validates :email, uniqueness: :true
  
  before_create :set_name
  

  def self.find_or_create_by_omniauth(auth)
		if user = self.find_by(email: auth['email'])
			user
		 else
			user = self.new(email: auth['email'], first_name: auth['first_name'], last_name: auth['last_name'])
			user.password = SecureRandom.hex
			user
		 end
	end
	
	def outstanding_loans?
	 self.loans.any? {|loan| loan.status == "checked_out"}
	end


end
