Rails.application.routes.draw do

  devise_for :users
  root to: "products#index"

  post 'products/create'
  resources :products
end
