module Admin
  class ArticlesController < BaseController
    before_action :parent_info, except: [:destroy, :create]
    before_action :find_article!, except: [:new, :create, :index]

    def index
      @articles = Article.where(category_id: params[:category]).page(params[:page])
      @category = Category.find(params[:category])
    end

    def show; end

    def new
      @article = Article.new
      @category = Category.find(params[:category])
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to admin_articles_path('category' => @article.category_id), notice: 'Article created.'
      else
        redirect_to admin_articles_path('category' => @article.category_id), alert: 'Unable to create article.'
      end
    end

    def edit
      @article = Article.find(params[:id])
    end

    def update
      if @article.update(article_params)
        redirect_to admin_articles_path('category' => @article.category_id), notice: 'Article updated.'
      else
        redirect_to admin_articles_path('category' => @article.category_id), alert: 'Unable to update articles.'
      end
    end

    def destroy
      if @article.destroy
        redirect_to admin_user_path, notice: 'User updated.'
      else
        redirect_to admin_user_path, alert: 'Unable to update users.'
      end
    end

    private

    def article_params
      params.require(:article).permit(:photo, :headline, :alt_text, :caption, :content,
                                      :location_id, :category_id)
    end

    def find_article!
      @article = Article.find(params[:id])
    end

    def parent_info
      @locations = Location.all
      @sub_categories = Category.all
    end
  end
end
