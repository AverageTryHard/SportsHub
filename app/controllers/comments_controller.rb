class CommentsController < ApplicationController
  before_action :find_comment!, except: [:new, :create]

  def show; end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new secure_params
    authorize @comment
    @comment.user = current_user
    @comment.save
    redirect_to @commentable_url, notice: 'Your comment was successfully posted.'
  end

  def destroy
    if @comment.destroy
      redirect_to article_path(@comment.commentable_id), notice: 'User updated.'
    else
      redirect_to article_path(@comment.commentable_id), alert: 'Unable to update users.'
    end
  end

  private

  def secure_params
    params.require(:comment).permit(:body)
  end

  def find_comment!
    @comment = Comment.find(params[:id])
    authorize @comment
  end
end
