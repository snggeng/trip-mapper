Rails.application.routes.draw do

  root 'trips#index'

  devise_for :users
  resources :users


  resources :trips do
    resources :locations
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
