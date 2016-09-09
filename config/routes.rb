Rails.application.routes.draw do
  get 'relationships/create'

  get 'relationships/destroy'

  resources :users, only: [:index]
  resources :relationships, only: [:create, :destroy]
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'top#index'
  resources :topics
  resources :users, only: [:index]

  resources :topics do
    resources :comments

    collection do
      post :confirm
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
