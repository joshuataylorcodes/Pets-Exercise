Rails.application.routes.draw do
  root "pets#index"

  resources :pets

  #this is for users(creating new users)
  get "/signup" => "users#new"
  post "/users" => "users#create"

  #this is for creating a session for a user
  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"

  
end
