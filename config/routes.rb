Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'users#index'
    resources :users do
      post :change_user_status
    end
  end

  root to: 'home#home'
end
