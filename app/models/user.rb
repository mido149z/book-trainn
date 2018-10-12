class User < ApplicationRecord

	# convert email ve chu thuong
	before_save { self.email = email.downcase }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

	validates :username,  presence: true, length: { maximum: 30 }

  	valid_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 100 },
                    format: { with: valid_email },
                    uniqueness: { case_sensitive: false }

    # Returns the hash digest of the given string.
  	def User.digest(string)
    	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
  	end
end
