Rails.application.routes.draw do
  get 'home/index'

  devise_for :users, controllers: {registrations: 'registrations'}
  
  resources :patents do
    post :select
  end

  root 'home#index'
end
