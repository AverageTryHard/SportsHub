class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
  layout :layout_by_resource

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email first_name last_name password password_confirmation
                                                         avatar])
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:username, :email, :password, :password_confirmation, :current_password, :avatar,
               :avatar_cache, :remove_avatar)
    end
  end

  def layout_by_resource
    if devise_controller?
      'user_signs_layout'
    else
      'application'
    end
  end
end
