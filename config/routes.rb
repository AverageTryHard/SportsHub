Rails.application.routes.draw do
  get 'admin/user_management'
  get 'user/index'
  root 'admin#user_management'
end
