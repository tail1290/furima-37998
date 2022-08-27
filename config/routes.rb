Rails.application.routes.draw do

  devise_for :users
  root to: "products#index"

  post 'sign_up', to: "devise/registrations#create"

end
