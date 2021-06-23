Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'users#index'
    resources :users
    put 'block_user', to: 'users#block_user'
    put 'activate_user', to: 'users#activate_user'
  end

  root to: 'home#home'
end
