require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  	def setup
	    @user = User.new(user:  "user", email: "user@example.com",
                     password: "user", password_confirmation: "user")
	  end
end
