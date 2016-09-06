Rails.application.routes.draw do
  get 'users/index'

  devise_for :users
  root 'top#index'
  resources :topics
  resources :users, only: [:index]
end
