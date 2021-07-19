Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'users#index'

    # Users
    resources :users
    put 'block_user', to: 'users#block_user'
    put 'activate_user', to: 'users#activate_user'

    # Languages
    resources :languages
    post 'create_from_select', to: 'languages#create_from_select'
    put 'change_language_status', to: 'languages#change_language_status'

    # Categories
    resources :categories
    post 'create_sub_category', to: 'categories#create_sub_category'
    post 'create_team', to: 'categories#create_team'
    put 'edit_team', to: 'categories#edit_team'
    delete 'destroy_team', to: 'categories#destroy_team'

    # Team
    resources :teams

    # Articles
    resources :articles
  end

  resources :articles do
    resources :comments
  end

  root to: 'home#home'
end
