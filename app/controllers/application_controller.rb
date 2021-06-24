class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_locales
  around_action :switch_locale
  include Pundit
  layout :layout_by_resource

  def switch_locale(&action)
    new_locale = params[:locale] || extract_locale_from_tld || I18n.default_locale.to_s
    I18n.with_locale(new_locale, &action)
  end

  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

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
    devise_controller? ? 'user_signs_layout' : 'application'
  end

  def load_locales
    @active_locales = Language.select { |language| language.status == true }
  end
end
