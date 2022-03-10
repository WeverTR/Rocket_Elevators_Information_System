Rails.application.routes.draw do
<<<<<<< HEAD
<<<<<<< HEAD
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # get 'home/index'
  root 'home#index'
=======
=======
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
>>>>>>> 5ec3c32e133ecc89c65e8910835275182c0a14f1
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  get "/index", to:"pages#index"
  get "/quote", to:"pages#quote"
  get "/corporate", to:"pages#corporate"
  get "/residential", to:"pages#residential"
<<<<<<< HEAD
>>>>>>> 8d9194f26fdb195551d73cf5c46bd55cb8491805
=======
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
>>>>>>> 5ec3c32e133ecc89c65e8910835275182c0a14f1
end
