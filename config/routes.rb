Rails.application.routes.draw do
  resources :quotes
  # get 'home/index'
  root 'home#index'
  # resources :employees
  # resources : user; only : [:new, :create, :edit, :update, :show, :destroy]

  # #session routes
  # get '/login', to: 'session#login'
  # post '/login', to: 'session#crate'
  # post '/login', to:'session#destroy'
  # get '/logout', to: 'session#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
