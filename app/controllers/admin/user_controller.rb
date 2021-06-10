module Admin
  class UserController < BaseController
    def index
      @users = policy_scope(User.all) # TODO : add pagination
    end

    def show
      @user = User.find(params[:id])
      authorize @user
    end
  end
end
