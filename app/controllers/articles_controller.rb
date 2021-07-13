class ArticlesController < ApplicationController
  layout 'application'

  def index
    @articles = Article.where(category_id: params[:category_id])
  end

  def show
    @article = Article.find(params[:id])
  end
end
