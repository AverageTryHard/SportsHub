Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'users#index'
    resources :users
    get 'update_user_status', to: 'users#update_user_status'
  end

  namespace :user_signs do
    root to: 'log_in#index'
    get '/sign_up', to: 'sign_up#index'
  end

  root to: 'home#home'
end
