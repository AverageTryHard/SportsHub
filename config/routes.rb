Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'user_management#user_management'
  end

  root to: 'home#home'
end
