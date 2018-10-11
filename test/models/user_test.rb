require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  	def setup
	    @user = User.new(username: "member", email: "member@gm.com",
	                     password: "member")
	  end
end
