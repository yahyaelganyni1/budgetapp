Rails.application.routes.draw do
  get 'users/index'
  get 'splash/index'
  get 'purchases/new'
  get 'purchases/_form'
  get 'categories/index'
  get 'categories/new'
  get 'categories/show'
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
