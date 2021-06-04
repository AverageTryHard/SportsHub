Rails.application.routes.draw do
  devise_for :users
  root to: 'user#index'

  namespace :admin do
    root to: 'home#home_page'
    resources :teams, only: :index
  end
end
