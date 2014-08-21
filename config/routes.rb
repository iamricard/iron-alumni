Rails.application.routes.draw do
  root 'front#index'

  devise_for :members, controllers: { registrations: 'custom_registrations' }
  resources :members, only: [:index, :show]
  resources :courses, only: [:index, :show, :create, :update, :update]
end
