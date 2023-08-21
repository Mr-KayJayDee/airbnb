Rails.application.routes.draw do
  devise_for :users
  # root to: "cars/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # If going to /cars redirect to /
  root to: "cars#index"
  get "/cars", to: redirect("/")
  resources :cars do
    resources :bookings, only: [:new, :create]
  end
end
