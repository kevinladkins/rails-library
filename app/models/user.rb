class User < ApplicationRecord

  has_secure_password

  enum role: [:patron, :librarian]

  def self.find_or_create_by_omniauth(auth)
    if user = self.find_by(email: auth['email'])
      user
    else
      user = self.create(email: auth['email'], name: auth['name'])
      user.password = SecureRandom.hex
      user
    end
  end


end
