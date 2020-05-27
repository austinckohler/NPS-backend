Rails.application.routes.draw do
  resources :parks
  resources :users, only: [:create]
  post "login", to: "authentication#login"
  get "user-profiles", to: "profiles#index"
  put "user-profiles", to: "profiles#update"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
