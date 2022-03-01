Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end

  root to: 'splash#index'

  devise_for :users

  resources :purchases
  resources :categories
end
