class UsersController < ApplicationController
  
  before_action :set_action ,only:[:edit,:update,:show]
  


  def index
    @user = User.all
  end
  def show

  end


  def new
    @user = User.new
  end


  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "User was successfully updated"
      redirect_to users_path
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]="You have Succesfully Signup #{@user.username}!"
      redirect_to users_path
    else
      render "new"
    end
  end

  private_methods

  def set_action
    @user=User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:username,:email,:password)
  end


end