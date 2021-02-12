class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]="You have Succesfully Signup #{@user.username}!"
      redirect_to articles_path
    else
      render "new"
    end
  end

  private_methods
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end
end