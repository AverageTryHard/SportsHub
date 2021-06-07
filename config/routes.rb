Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'user#user'
  end

  root to: 'home#home'
end
