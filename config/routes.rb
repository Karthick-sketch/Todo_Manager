Rails.application.routes.draw do
  get "/" => "home#index"

  resources :todos

  post "users/login", to: "users#login"
  resources :users

  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
end
