Rails.application.routes.draw do
  get "/" => "home#index"

  resources :todos

  post "users/login", to: "users#login"
  resources :users
end
