class SessionController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    if logged_in?
      flash[:alert] = "Currently Logged in first logout"
      redirect_to articles_path
    end
  end
  
  def create
    if logged_in?
      flash[:alert] = "Currently Logged in first logout"
      redirect_to articles_path
    end
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id]=user.id
      flash[:success] = "Logged in Successfully"
      redirect_to user
    else
      #use flash.now with render as it need http 144 request
      flash.now[:alert] = "Something wrong with the login details"
      render 'new'
    end

  end

  def destroy
    if not logged_in?
      flash[:alert] = "First Logged in first logout"
      redirect_to login_path
    end
    flash[:alert]="Logged Out"
    session[:user_id]=nil
    redirect_to root_path
  end
end