Rails.application.routes.draw do
  get "log-out" => "sessions#destroy", :as => "log-out"
  get "log-in" => "sessions#new", :as => "log-in"
  get "sign-up" => "users#new", :as => "sign-up"

  resources :posts
  resources :users
  resources :sessions
  root 'welcome#index'
end
