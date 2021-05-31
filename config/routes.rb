Rails.application.routes.draw do
  device_for :users
  get :admin_layout, to: 'admin_layout#admin_layout', path: 'admin-cabinet'
  get :user_layout, to: 'user_layout#user_layout', path: 'main-page'
  root "admin_layout#admin_layout"
end
