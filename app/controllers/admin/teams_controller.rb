module Admin
  class TeamsController < BaseController
    def index
      @teams = Teams.all
    end

    def create
      @category = Teams.new(category_params)
    end

    private

    def teams_params
      params.require(:category).permit(:name)
    end
  end
end
