module Admin
  class UsersController < BaseController
    include UsersHelper
    before_action
    # skip_before_action :verify_authenticity_token
    def index
      @users = User.all
      @admins = User.select { |user| user.is_admin == true }
    end

    def show
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(secure_params)
        redirect_to admin_user_path, :notice => "User updated."
      else
        redirect_to admin_user_path, :alert => "Unable to update users."
      end
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
      return unless user.destroyed?

      ApplicationMailer.with(user: user).destroy_user_notify.deliver
      redirect_to admin_root_path
    end

    def block_user
      @user = User.find(params[:id])
      new_status = params[:new_status]
      @user.update_attribute(:status, new_status)

      ApplicationMailer.with(user: user).update_user_status_notify.deliver
      redirect_to admin_root_path
    end

    private

    def secure_params
      params.require(:user).permit(:first_name, :last_name, :status)
    end
  end
end
