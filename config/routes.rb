Rails.application.routes.draw do
  root "static_pages#home"

  get 'users/show'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  resources :users
end
