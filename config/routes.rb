Rails.application.routes.draw do
  # get 'home/index'
  resources :quotes
  root 'home#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
end
