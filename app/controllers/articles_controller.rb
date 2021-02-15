class ArticlesController < ApplicationController

  before_action :set_action ,only:[:show,:destroy,:edit,:update]

  before_action :require_user, except:[:show,:index]

  before_action :same_user, except:[:show,:index]

  


  def show
    #@ will make it a instance variable and now we can use it in the html file
    
  end


  def destroy
    @article.destroy
    flash[:notice]="Article Deleted Successfully"
    redirect_to articles_path

  end


  def edit

  end

  def update
    if @article.update(article_params)
      flash[:notice]="Updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def index
    @articles=Article.paginate(page: params[:page], per_page: 2)
  end

  def new
    @article =Article.new()
  end

  def create
    #@article = Article.new(params[:article]) this is not allowed as it also has some secuirty paramaters so we need to whitelash these
    # to get our required input
    @article = Article.new(article_params)
    @article.user = current_user
    if not @article.save
      render 'new'
    else
      flash[:notice]="Article Saved Successfully"
      redirect_to @article
    end
  end


  private

  def set_action
    @article=Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title,:description)
  end

  def same_user
    if current_user != @article.user and current_user.admin? == false
      flash[:alert] = "You can edit your own articles only"
      redirect_to @article
    end
  end
end
