module Admin
  class UsersController < BaseController
    before_action :find_record, except: [:index]
    def index
      @users = User.all
    end

    def edit; end

    def update
      if @user.update(user_params)
        redirect_to admin_root_path
      else
        render :edit
      end
    end

    def change_user_status
      new_status = params[:user_status]

      @user.update(status: new_status)
    end

    def destroy
      @user.destroy

      redirect_to admin_root_path
    end

    private

    def user_params
      params.require(:user)
    end

    def find_record
      @user = User.find(params[:id])
    end
  end
end
