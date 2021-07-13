class Articles::CommentsController < CommentsController
  before_action :set_commentable

  private

  def set_commentable
    @commentable_url = article_path(params[:article_id])
    @commentable = Article.find(params[:article_id])
  end
end
