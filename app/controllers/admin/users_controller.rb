module Admin
  class UsersController < BaseController
    before_action :authorize_user!, except: :index

    def index
      params[:is_admin] = false if params[:is_admin].nil?
      @search = User.ransack(params[:q])
      @users = policy_scope(@search.result.where(is_admin: params[:is_admin])).page(params[:page])
    end

    def show; end

    def update
      if @user.update(secure_params)
        redirect_to admin_user_path, notice: 'User updated.'
      else
        redirect_to admin_user_path, alert: 'Unable to update users.'
      end
    end

    def destroy
      @user.destroy
      return unless user.destroyed?

      ApplicationMailer.with(user: user).destroy_user_notify.deliver_later
      redirect_to admin_root_path
    end

    def block_user
      @user.assign_attributes({ status: 'blocked' })

      @user.save do
        ApplicationMailer.with(user: @user, status: 'blocked').updated_user_status_notify.deliver_later
        redirect_to admin_root_path
      end
    end

    def activate_user
      @user.assign_attributes({ status: 'active' })

      @user.save do
        ApplicationMailer.with(user: @user, status: 'activated').updated_user_status_notify.deliver_later
        redirect_to admin_root_path
      end
    end

    def new_object_partial_is_exist
      false
    end

    private

    def secure_params
      params.require(:user).permit(:first_name, :last_name, :status, :avatar)
    end

    def authorize_user!
      @user = User.find(params[:id])
      authorize @user
    end
  end
end
