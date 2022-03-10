Rails.application.routes.draw do
  # get 'home/index'
  # resources :employees
  # resources : user; only : [:new, :create, :edit, :update, :show, :destroy]

  # #session routes
  # get '/login', to: 'session#login'
  # post '/login', to: 'session#crate'
  # post '/login', to:'session#destroy'
  # get '/logout', to: 'session#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  get "/index", to:"pages#index"
  get "/quote", to:"pages#quote"
  get "/corporate", to:"pages#corporate"
  get "/residential", to:"pages#residential"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :quotes
end
