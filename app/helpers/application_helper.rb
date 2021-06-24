module ApplicationHelper
  def current_layout
    controller.send :_layout, lookup_context, []
  end

  def render_user_avatar
    if current_user.avatar.attached?
      image_tag(current_user.avatar, class: 'rounded-circle', size: '50x50')
    else
      image_tag('avatar.jpg', class: 'rounded-circle', size: '50x50')
    end
  end

  def current_locale
    params[:locale] || session[:locale]
  end
end
