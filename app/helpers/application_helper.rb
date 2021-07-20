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

  def render_article_photo(article)
    photo_size = '300x150'
    if article.photo.attached?
      image_tag(article.photo, size: photo_size)
    else
      image_tag('avatar.jpg', size: photo_size)
    end
  end

  def base_class_name
    controller.class.superclass.name
  end

  def current_locale
    params[:locale] || session[:locale]
  end
end
