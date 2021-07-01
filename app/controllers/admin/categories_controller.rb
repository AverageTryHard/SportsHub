module Admin
  class CategoriesController < BaseController
    def index
      @categories = Category.where(parent_category_id: nil).page(params[:page])

      return unless @categories.any?

      @selected_category_id = params[:parent_category_id]
      check_selected_category

      load_sub_categories_and_teams
    end

    def check_selected_category
      return if @categories.select { |category| category.id == @selected_category_id.to_i }.any?

      @selected_category_id = @categories.first.id
      params[:parent_category_id] = @selected_category_id
    end

    def load_sub_categories_and_teams
      @sub_categories = Category.where(parent_category_id: @selected_category_id.to_i)

      return unless @sub_categories.any?

      @selected_sub_category_id = params[:sub_categories_id] || @sub_categories.first[:id]
      @teams = Teams.select { |team| team.categories_id == @selected_sub_category_id.to_i }
    end

    def create
      @category = Category.new(category_params)
      @category.save
      redirect_to admin_categories_path
    end

    def create_sub_category
      @sub_category = Category.new(sub_category_params)

      return unless @sub_category.save

      redirect_to admin_categories_path('parent_category_id' => @sub_category.parent_category_id,
                                        'sub_categories_id' => @sub_category.id)
    end

    def create_sub_category_team
      @team = Teams.new(sub_category_team_params)
      @team.save

      sub_category = Category.find(@team.categories_id)
      redirect_to admin_categories_path('parent_category_id' => sub_category.parent_category_id,
                                        'sub_categories_id' => sub_category.id)
    end

    def edit
      @category = Category.find(params[:id])
    end

    def update
      @category = Category.find(params[:id])
      if @category.update(category_params)
        redirect_to admin_categories_path, notice: 'User updated.'
      else
        redirect_to admin_categories_path, alert: 'Unable to update users.'
      end
    end

    def destroy
      @category = Category.find(params[:id])
      if @category.present?
        @category.destroy
      end
      if @category.parent_category_id.nil?
        redirect_to admin_categories_path
      else
        redirect_to admin_categories_path('parent_category_id' => @category.parent_category_id)
      end
    end

    def destroy_team
      @team = Teams.find(params[:id])
      if @team.present?
        @team.destroy
      end

      sub_category = Category.find(@team.categories_id)
      redirect_to admin_categories_path('parent_category_id' => sub_category.parent_category_id,
                                        'sub_categories_id' => sub_category.id)
    end

    private

    def category_params
      params.require(:category).permit(:name)
    end

    def sub_category_params
      params.require(:category).permit(:name, :parent_category_id)
    end

    def sub_category_team_params
      params.require(:teams).permit(:name, :location, :categories_id, :category)
    end
  end
end
