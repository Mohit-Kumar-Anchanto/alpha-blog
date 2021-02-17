class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice]="Successfully Created!"
      redirect_to @category
    else
      render "new"
    end
  end
  def show
    @category = Category.find(params[:id])
  end

  def index

  end

  private_methods

  def category_params
    params.require(:category).permit(:name)
  end
end