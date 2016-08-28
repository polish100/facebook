Rails.application.routes.draw do
  root to: 'top#index'
  resources :topics
end
