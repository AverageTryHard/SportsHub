Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'users#index'

    # Users
    resources :users
    put 'block_user', to: 'users#block_user'
    put 'activate_user', to: 'users#activate_user'

    # Language
    resources :languages
    post 'create_from_select', to: 'languages#create_from_select'
    post 'change_language_status', to: 'languages#change_language_status'
  end

  root to: 'home#home'
end
