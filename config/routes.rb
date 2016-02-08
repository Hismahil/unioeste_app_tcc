Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  get "log-out" => "sessions#destroy", :as => "log-out"
  get "log-in" => "sessions#new", :as => "log-in"
  get "sign-up" => "users#new", :as => "sign-up"

  resources :posts do
  	resources :comments
  end
  
  resources :users
  resources :sessions
  root 'welcome#index'
end
