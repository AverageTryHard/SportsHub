Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'users#index'

    # Users
    resources :users
    get 'block_user', to: 'users#block_user'
    get 'activate_user', to: 'users#activate_user'

    # Language
    resources :language
    post 'create_from_select', to: 'language#create_from_select'
    post 'change_language_status', to: 'language#change_language_status'
  end

  root to: 'home#home'
end
