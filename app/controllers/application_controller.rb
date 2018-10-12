class ApplicationController < ActionController::Base

	#bien nay de chan truy cap voi 1 nguon khac he thong
	protect_from_forgery prepend: true, with: :exception

	include SessionsHelper
	
	def index
	end
end
