Rails.application.routes.draw do
  devise_for :users
  get :admin_layout, to: 'admin_layout#user_management', path: 'admin-cabinet'

  get :user_layout, to: 'user_layout#home', path: 'main-page'

  root :to => 'admin_layout#user_management'
end
