class UsersController < ApplicationController
	before_action :logged_in_user, only: [:edit, :update, :index, :show, :destroy]
	before_action :is_login, only: [:new, :create]

	# chi co admin moi co quyen xoa user
	before_action :admin_user, only: :destroy

	layout "login", :only => [:create, :new, :landing_page] 

	def landing_page
		
	end

	def index

		if !current_user.admin
			flash[:danger] = "This page not intended for user!"
			redirect_to '/books'
		end
		
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
	    check_permission_view(@user)
	end

	def show

		@user = User.find(params[:id])
		check_permission_view(@user)
	end

	def update

	    @user = User.find(params[:id])
	    check_permission_view(@user)
	    if @user.update_attributes(user_params)
	      
	      	flash[:success] = "Update success!"
      		redirect_to @user
	    else

	    	flash[:danger] = "Error. Please type again!"
	      	render 'edit'
	    end
	end

	def destroy

	    User.find(params[:id]).destroy
	    flash[:success] = "User deleted!"
	    redirect_to users_url
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
		  params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
		end

		# Confirms an admin user.
	    def admin_user
	      	redirect_to(root_url) unless current_user.admin?
	    end
end
	