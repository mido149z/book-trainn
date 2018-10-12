class User < ApplicationRecord
	attr_accessor :remember_token

	# convert email ve chu thuong
	before_save { self.email = email.downcase }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

	validates :username, length: { maximum: 30 }, allow_nil: true

  	valid_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 100 },
                    format: { with: valid_email },
                    uniqueness: { case_sensitive: false }

    class << self
	  	def digest(string)
	    	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	                                                  BCrypt::Engine.cost
	    	BCrypt::Password.create(string, cost: cost)
	  	end

	  	# Returns a random token.
		def new_token
			SecureRandom.urlsafe_base64
		end
	end

	# Remembers a user in the database for use in persistent sessions.
	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	# Returns true if the given token matches the digest.
	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	# Forgets a user.
	def forget
		update_attribute(:remember_digest, nil)
	end
end
