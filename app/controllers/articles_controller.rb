class ArticlesController < ApplicationController
  def show
    #@ will make it a instance variable and now we can use it in the html file
    @article=Article.find(params[:id])
  end
end
