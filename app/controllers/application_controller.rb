class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_locales
  before_action :check_for_locale_change
  around_action :switch_locale
  include Pundit
  layout :layout_by_resource

  def switch_locale(&action)
    default_locale = @active_locales.first || 'en'
    locale = extract_locale_from_tld || params[:locale] || session[:locale] || @default_locales[default_locale]
    I18n.with_locale(locale, &action)
    session[:locale] = locale
  end

  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def check_for_locale_change
    new_locale = params[:new_locale]

    if new_locale.present? && new_locale != params[:locale]
      redirect_to url_for(params.merge(locale: new_locale, new_locale: nil))
    end
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
    @default_locales = { 'en' => :en, 'gr' => :gr, 'fr' => :fr, 'es' => :es }
  end
end
