class ApplicationController < ActionController::Base

	#bien nay de chan truy cap voi 1 nguon khac he thong
	protect_from_forgery prepend: true, with: :exception

	include SessionsHelper
	
	def index
	end

	def check_permission_view(user)
		if !current_user.admin && user.id != current_user.id

			flash[:danger] = "Don't see this user!"
			redirect_to '/'
		end
	end

	def check_is_admin(user)
		
		if !user.admin
			flash[:danger] = "You isn't admin!"
			redirect_to '/'
		end
	end
end
