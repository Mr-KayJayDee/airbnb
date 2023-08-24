Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  root to: "cars#index"

  resources :cars do
    resources :bookings, only: [:new, :create]
  end

  namespace :profile do
    resources :bookings, only: [:index, :show]
    resources :cars
    root to: "cars#index"
  end

end
