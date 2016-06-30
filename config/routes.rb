Rails.application.routes.draw do

  root 'trips#index'

  devise_for :users
  resources :users


  resources :trips do
    resources :locations
    resources :teams, except: [:create]
    post 'create_team', to: 'teams#create'
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
