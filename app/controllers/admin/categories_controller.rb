module Admin
  class CategoriesController < BaseController
    def index
      @primary_categories = Category.primary.page(params[:page])

      return unless @primary_categories.any?

      @selected_category_id = params[:parent_category_id] || @primary_categories.first.id

      load_sub_categories_and_teams
    end

    def load_sub_categories_and_teams
      @sub_categories = Category.where(parent_category_id: @selected_category_id.to_i)

      return unless @sub_categories.any?

      @selected_sub_category_id = params[:sub_categories_id] || @sub_categories.first.id
      @teams = Team.select { |team| team.categories_id == @selected_sub_category_id.to_i }
      @teams = Team.where(categories_id: @selected_sub_category_id.to_i)
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to admin_categories_path, notice: 'Your category was successfully added.'
      else
        redirect_to admin_categories_path, alert: "Your category wasn't added."
      end
      @category.save
    end

    def create_sub_category
      @sub_category = Category.new(sub_category_params)

      return unless @sub_category.save

      redirect_to admin_categories_path('parent_category_id' => @sub_category.parent_category_id,
                                        'sub_categories_id' => @sub_category.id)
    end

    def create_team
      @team = Team.new(sub_category_team_params)
      @team.save

      sub_category = Category.find(@team.categories_id)
      redirect_to admin_categories_path('parent_category_id' => sub_category.parent_category_id,
                                        'sub_categories_id' => sub_category.id)
    end

    def edit_team
      @team = Team.find(params[:id])
    end

    def update_team
      @team = Team.find(params[:id])
      if @team.update(teams_params)
        redirect_to admin_categories_path, notice: 'Team updated.'
      else
        redirect_to admin_categories_path, alert: 'Unable to update team.'
      end
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
      @category.destroy
      if @category.parent_category_id.nil?
        redirect_to admin_categories_path
      else
        redirect_to admin_categories_path('parent_category_id' => @category.parent_category_id)
      end
    end

    def destroy_team
      @team = Team.find(params[:id])
      @team.destroy

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
