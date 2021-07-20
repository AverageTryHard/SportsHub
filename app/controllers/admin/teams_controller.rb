module Admin
  class TeamsController < BaseController
    def index
      @teams = Team.all
    end

    def new
      @team = Team.new
      @sub_categories = Category.sub_categories
    end

    def create
      @team = Team.new(teams_params)
      @team.save

      redirect_to admin_teams_path
    end

    def edit
      @team = Team.find(params[:id])
    end

    def update
      @team = Team.find(params[:id])
      if @team.update(teams_params)
        redirect_to admin_teams_path, notice: 'Team updated.'
      else
        redirect_to admin_teams_path, alert: 'Unable to update team.'
      end
    end

    def destroy
      return if @team.blank?

      @team.destroy
    end

    private

    def teams_params
      params.require(:teams).permit(:name, :location, :categories_id, :category)
    end
  end
end
