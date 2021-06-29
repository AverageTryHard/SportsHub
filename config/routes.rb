Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'users#index'

    # Users
    resources :users
    put 'block_user', to: 'users#block_user'
    put 'activate_user', to: 'users#activate_user'

    # Categories
    resources :categories
    post 'create_sub_category', to: 'categories#create_sub_category'
    post 'create_sub_category_team', to: 'categories#create_sub_category_team'
    delete 'destroy_team', to: 'categories#destroy_team'

    # Teams
    resources :teams
  end

  root to: 'home#home'
end
