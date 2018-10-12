class UsersController < ApplicationController

	def landing_page
		
	end

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create

		@user = User.new(user_params)
		if @user.save

			log_in @user
			flash[:success] = "Save success!"
		  	redirect_to 'new'
		else
		  render 'new'
		end
	end

	def edit
	    @user = User.find(params[:id])
	end

	def show
		@user = User.find(params[:id])
	end

	def update
	    @user = User.find(params[:id])
	    if @user.update_attributes(user_params)
	      
	      	flash[:success] = "Update success!"
      		redirect_to @user
	    else

	    	flash[:danger] = "Error. Please type again!"
	      	render 'edit'
	    end
	end

	# nhung ham xai cho rieng controller nay
	private
		def user_params
		  params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end
end
	