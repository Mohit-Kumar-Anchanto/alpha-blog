class UsersController < ApplicationController
  
  before_action :set_action ,only:[:edit,:update,:show,:destroy]

  before_action :require_user, except:[:show,:index,:new,:create,:destroy]

  before_action :same_user, except:[:show,:index,:new,:create,:destroy]



  def index
    @user = User.paginate(page: params[:page], per_page: 2)
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 1)
  end


  def new
    @user = User.new
  end

  def destroy
    @user.delete
    session[:user_id]=nil if @use
    flash[:notice]="Deleted Successfully"
    redirect_to root_path

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
      session[:user_id]=@user.id
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

  def same_user
    if current_user != @user and current_user.admin? == false
      flash[:alert] = "You can edit your own profile only"
      redirect_to @user
    end
  end

end