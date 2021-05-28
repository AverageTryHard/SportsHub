Rails.application.routes.draw do
  # devise_for :users
  get 'admin/user_management'
  root to: 'admin#user_management'
end
