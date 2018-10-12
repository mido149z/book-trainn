class UsersController < ApplicationController
	before_action :logged_in_user, only: [:edit, :update, :index, :show]

	def landing_page
		
	end

	def index
		@users = User.paginate(page: params[:page], :per_page => 20)
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

	# Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

	# nhung ham xai cho rieng controller nay
	private
		def user_params
		  params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end
end
	