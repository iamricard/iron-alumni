Rails.application.routes.draw do
  root 'front#index'

  devise_for :members, controllers: { registrations: 'custom_registrations' }
  resources :members, only: [:index, :show]
  resources :courses, only: [:index, :show, :create, :update, :update]
  resources :courses do
    resources :members, :controller => 'courses_member', :only => [:update]
  end
  resources :members do
    resources :courses, :controller => 'member_courses', :only => [:update]
  end
end
