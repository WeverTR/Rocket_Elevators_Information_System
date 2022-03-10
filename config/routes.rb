Rails.application.routes.draw do
<<<<<<< HEAD
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # get 'home/index'
  root 'home#index'
=======
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  get "/index", to:"pages#index"
  get "/quote", to:"pages#quote"
  get "/corporate", to:"pages#corporate"
  get "/residential", to:"pages#residential"
>>>>>>> 8d9194f26fdb195551d73cf5c46bd55cb8491805
end
