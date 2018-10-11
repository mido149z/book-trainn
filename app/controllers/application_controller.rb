class ApplicationController < ActionController::Base

	#bien nay de chan truy cap voi 1 nguon khac he thong
	protect_from_forgery with: :exception

	def index
	end
end
