module Admin
    class TeamsController < BaseController
        def index
            @teams = ['PSG', 'Manchester City', 'Real Madrid']
        end   
    end
end        