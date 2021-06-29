module Admin
  class CategoriesController < BaseController
    def index
      @categories = Category.select { |category| category.categories_id.nil? }
      category_id = @categories.first[:id]
      @sub_categories = Category.select { |category| category.categories_id == category_id }
      team_category_id = @sub_categories.first[:id]
      @teams = Teams.select { |team| team.categories_id == team_category_id }
    end

    def create
      @category = Category.new(category_params)
    end

    def create_sub_category
      @sub_category = Category.new(sub_category_params)
    end

    private

    def category_params
      params.require(:category).permit(:name)
    end

    def sub_category_params
      params.require(:category).permit(:name, :category_id)
    end
  end
end
