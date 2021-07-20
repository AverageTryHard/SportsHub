class HomeController < ApplicationController
  layout 'application'
  def home; end

  # def category_articles
  #   @articles = Article.where(category_id: params[:category_id])
  # end
  #
  # def article_page
  #   @article = Article.find(params[:article_id])
  # end
end
