Rails.application.routes.draw do
  get 'area/index'

  get 'home/index'

  devise_for :users, controllers: {registrations: 'registrations'}
  
  resources :patents, only: ['index', 'create', 'destroy'] do
    post :select
  end

  resources :areas, only: ['index']
  get 'spots/:id/select', to: 'spots#reserve', as: 'reserve_spot'
  delete 'spot/:id/free', to: 'spots#free', as: 'free_spot'

  root 'home#index'
end
