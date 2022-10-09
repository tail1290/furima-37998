Rails.application.routes.draw do

  devise_for :users
  root to: "products#index"

  post 'products/create'

  resources :products do
    resources :orders, only: [:index, :create]
<<<<<<< Updated upstream
   end
=======
  end

  

>>>>>>> Stashed changes
end
