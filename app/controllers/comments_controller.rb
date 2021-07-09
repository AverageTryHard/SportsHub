class CommentsController < ApplicationController
  before_action :find_comment!, except: [:new, :create]

  def article_comments
    @comments = Comment.find_by(params[article_id: :article_id])
  end

  def show; end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(secure_params)
    if @article.save
      redirect_to admin_articles_path, notice: 'Article created.'
    else
      redirect_to admin_articles_path, alert: 'Unable to create article.'
    end
  end

  def destroy
    if @comment.destroy
      redirect_to admin_user_path, notice: 'User updated.'
    else
      redirect_to admin_user_path, alert: 'Unable to update users.'
    end

    return unless user.destroyed?

    ApplicationMailer.with(user: user).destroy_user_notify.deliver_later
    redirect_to admin_root_path
  end

  private

  def secure_params
    params.require(:comment).permit(:body, :user_id, article_id)
  end

  def find_comment!
    @comment = Comment.find(params[:id])
  end
end
