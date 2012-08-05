DigitalEnvy::Application.routes.draw do
  get "products/index"

  get "products/show"

  root to: "sessions#new"
  resources :products
  match "/auth/storenvy/callback", to: "sessions#create"
  match "/auth/failure", to: "sessions#failure"
  match "/logout", to: "sessions#destroy", :as => "logout"
  
end
