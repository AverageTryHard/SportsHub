module Admin
  class UsersController < BaseController
    include UsersHelper
    before_action
    # skip_before_action :verify_authenticity_token
    def index
      @users = policy_scope(User.all)
      @admins = @users.select { |user| user.is_admin == true }
    end

    def show
      @user = policy_scope(User.find(params[:id]))
      authorize @user
    end

    def update
      @user = policy_scope(User.find(params[:id]))
      if @user.update_attributes(secure_params)
        redirect_to admin_user_path, :notice => "User updated."
      else
        redirect_to admin_user_path, :alert => "Unable to update users."
      end
    end

    def destroy
      user = policy.scope(User.find(params[:id]))
      user.destroy
      return unless user.destroyed?

      ApplicationMailer.with(user: user).destroy_user_notify.deliver
      redirect_to admin_root_path
    end

    def block_user
      @user = User.find(params['format'])
      @user.update_attribute(:status, 'blocked')

      ApplicationMailer.with(user: @user, status: 'blocked').updated_user_status_notify.deliver
      redirect_to admin_root_path
    end

    def activate_user
      @user = User.find(params['format'])
      @user.update_attribute(:status, 'active')

      ApplicationMailer.with(user: @user, status: 'activated').updated_user_status_notify.deliver
      redirect_to admin_root_path
    end

    private

    def secure_params
      params.require(:user).permit(:first_name, :last_name, :status)
    end
  end
end
