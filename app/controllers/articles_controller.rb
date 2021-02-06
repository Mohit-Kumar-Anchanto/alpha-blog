class ArticlesController < ApplicationController
  def show
    #@ will make it a instance variable and now we can use it in the html file
    @article=Article.find(params[:id])
  end

  def index
    @articles=Article.all
  end

  def new
  end

  def create
    #@article = Article.new(params[:article]) this is not allowed as it also has some secuirty paramaters so we need to whitelash these
    # to get our required input
    @article = Article.new(params.require(:article).permit(:title,:description))
    @article.save

    redirect_to article_path(@article)
  end
end
