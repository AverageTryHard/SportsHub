class ArticlesController < ApplicationController
  layout 'application'

  def index
    @articles = Article.published.where(category_id: params[:category_id]).page(params[:page])
  end

  def show
    @article = Article.published.find(params[:id])
  end
end
