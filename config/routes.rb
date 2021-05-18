Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :offices do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'dashboard', to: 'pages#dashboard'
end
