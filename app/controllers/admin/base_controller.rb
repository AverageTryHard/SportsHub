module Admin
  class BaseController < ::ApplicationController
    before_action :check_user_is_admin
    before_action :load_categories
    layout 'admin_layout'

    def check_user_is_admin
      admin_status = current_user ? current_user.is_admin? : false
      return if admin_status

      redirect_to root_path
    end

    def load_categories
      @categories = Category.primary.all
    end
  end
end
