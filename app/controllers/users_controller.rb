class UsersController < ApplicationController

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

  def show
  	@user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:User).permit(:username, :email, :password)
    end
end
	