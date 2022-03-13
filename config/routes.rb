Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  get "/index", to:"pages#index"
  get "/quote", to:"quote#quote"
  get "/corporate", to:"pages#corporate"
  get "/residential", to:"pages#residential"
  resources :quote
end
