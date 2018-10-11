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
      params.require(:User).permit(:name, :email, :password)
    end
end
	