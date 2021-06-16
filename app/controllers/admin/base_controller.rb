module Admin
  class BaseController < ::ApplicationController
    before_action :check_user_is_admin
    layout 'admin_layout'

    def check_user_is_admin
      return if current_user.is_admin?

      redirect_to root_path
    end
  end
end
