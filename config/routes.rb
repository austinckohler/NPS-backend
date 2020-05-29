Rails.application.routes.draw do
  resources :alerts
  resources :parks
  resources :users, only: [:index, :show, :create]
  post "login", to: "authentication#login"
  get "login", to: "authentication#login"
  get "user-profiles", to: "profiles#index"
  put "user-profiles", to: "profiles#update"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
