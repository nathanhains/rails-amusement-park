Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :attractions
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/rides", to: "rides#create"
  root "application#index"
end
