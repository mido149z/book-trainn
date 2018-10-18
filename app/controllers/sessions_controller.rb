class SessionsController < ApplicationController
  before_action :remove_notice
  before_action :is_login, only: [:new, :create]
  
  layout "login", :only => [:create, :new] 

  def new
  end

  def create

  	data = params[:session]
  	user = User.find_by(email: data[:email].downcase)

  	# kiem tra xem co user khong? va verify password
    if user && user.authenticate(data[:password])

    	# chuyen trang den book index
    	log_in user
    	data[:remember_me] == '1' ? remember(user) : forget(user)

      	redirect_to user
    else

    	# thong bao loi ra view
    	flash[:danger] = "Invalid email/password. Please type again!"
      
    	# render html voi view new
      @email = data[:email].downcase

    	render 'new'
    end
  end

  def destroy

  	log_out if logged_in?
  	redirect_to login_url
  end

  def typemenu
    if(params[:type])

      # tam thoi luu vao session cua user login
      session[:menu] = params[:type]
    end
  end

  private

    def remove_notice
      flash[:notice] = nil
    end
end
