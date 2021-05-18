Rails.application.routes.draw do
  # get 'offices/index'
  # get 'offices/show'
  # get 'offices/new'
  # get 'offices/create'
  # get 'offices/edit'
  devise_for :users
  root to: 'pages#home'

  resources :offices do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
