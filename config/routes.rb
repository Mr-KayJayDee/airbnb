Rails.application.routes.draw do
  devise_for :users
  
  root to: "cars#index"
  resources :cars do
    resources :bookings, only: [:new, :create]
  end
end
