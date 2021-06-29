module Admin
  class TeamsController < BaseController
    def index
      @teams = Teams.all
    end

    def create
      @team = Teams.new(teams_params)

      return unless @team.save

      redirect_to admin_teams_path
    end

    def edit
      @team = Teams.find(params[:id])
    end

    def update
      @team = Teams.find(params[:id])
      if @team.update(teams_params)
        redirect_to admin_categories_path, notice: 'Team updated.'
      else
        redirect_to admin_categories_path, alert: 'Unable to update team.'
      end
    end

    def destroy
      @team.destroy
    end

    private

    def teams_params
      params.require(:teams).permit(:name, :location, :categories_id)
    end
  end
end
