class User < ApplicationRecord

  has_many :loans, :foreign_key => "patron_id"
  has_many :borrowed_books, :through => :loans , :source => :book

  has_secure_password

  validates :first_name, :last_name, :email, :role, presence: :true
  validates :email, uniqueness: :true

  enum role: [:patron, :librarian]
  
  before_create :set_name
  
  include Namable::InstanceMethods
  

	def self.find_or_create_by_omniauth(auth)
		if user = self.find_by(email: auth['email'])
		  user
		else
		  user = self.create(email: auth['email'], name: auth['name'])
		  user.password = SecureRandom.hex
		  user
		end
	end


	def number_of_loans
	  checked_out_books.size
	end

	def checked_out_books
		loans.checked_out.map {|l| l.book}
	end
	


end
