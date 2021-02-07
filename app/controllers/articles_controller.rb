class ArticlesController < ApplicationController
  def show
    #@ will make it a instance variable and now we can use it in the html file
    @article=Article.find(params[:id])
  end


  def destroy
    @article=Article.find(params[:id])
    @article.destroy
    flash[:notice]="Article Deleted Successfully"
    redirect_to articles_path
  
  end
  def edit
    @article=Article.find(params[:id])
  end

  def update
    @article=Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title,:description))
      flash[:notice]="Updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end
  def index
    @articles=Article.all
  end

  def new
    @article =Article.new()
  end

  def create
    #@article = Article.new(params[:article]) this is not allowed as it also has some secuirty paramaters so we need to whitelash these
    # to get our required input
    @article = Article.new(params.require(:article).permit(:title,:description))
    if not @article.save
      render 'new'
    else
      flash[:notice]="Article Saved Successfully"
      redirect_to @article
    end
  end
end
