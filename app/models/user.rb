class User < ApplicationRecord

	# validate_email = "/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i"
	# validates :email, presence: true, format: {with: validate_email}

	# validates :password, presence: true	length: {minimum: 6, maximum: 30}
	# validates :username, presence: true length: {minimum: 4, maximum: 30}
end
