class CommentsController < ApplicationController
  before_action :find_comment!, except: [:new, :create]
  before_action :set_commentable

  def index
    @comments = Comment.where(commentable_id: @commentable).page(params[:page])
  end

  def show; end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new secure_params
    authorize @comment
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable_url, notice: 'Your comment was successfully posted.'
    else
      redirect_to @commentable_url, alert: "Your comment wasn't posted."
    end
  end

  def destroy
    if @comment.destroy
      redirect_to article_path(@comment.commentable_id), notice: 'User updated.'
    else
      redirect_to article_path(@comment.commentable_id), alert: 'Unable to update users.'
    end
  end

  private

  def set_commentable
    @commentable_url = article_path(params[:article_id])
    @commentable = Article.find(params[:article_id])
  end

  def secure_params
    params.require(:comment).permit(:body)
  end

  def find_comment!
    @comment = Comment.find(params[:id])
    authorize @comment
  end
end
