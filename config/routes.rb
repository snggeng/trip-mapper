Rails.application.routes.draw do

  root 'trips#index'

  devise_for :users
  resources :users

  get 'about', to: 'teams#index'

  resources :trips do
    resources :locations
    resources :teams, except: [:create]
    post 'create_team', to: 'teams#create'
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
