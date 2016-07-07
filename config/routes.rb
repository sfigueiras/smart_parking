Rails.application.routes.draw do
  get 'area/index'
  get '/areas/generate', as: 'generate_areas'

  get 'home/index'

  authenticated :user do
    root to: 'areas#index', as: :authenticated_root
  end

  devise_for :users, controllers: {registrations: 'registrations'}
  
  resources :patents, only: ['index', 'create', 'destroy'] do
    post :select
  end

  resources :reservations, only: ['index']
  resources :areas, only: ['index']
  resources :payments, only: ['index', 'create', 'destroy']
  
  get 'spots/:id/select', to: 'spots#reserve', as: 'reserve_spot'
  delete 'spot/:id/free', to: 'spots#free', as: 'free_spot'
  get 'reservations/:id/pay', to: 'reservations#pay', as: 'pay_reservation'
  patch 'reservations/:id/pay', to: 'reservations#save_pay', as: 'save_pay_reservation'

  get 'areas/interested_areas', to: 'areas#interested_areas', as: 'interested_areas'

  root 'home#index'
end
