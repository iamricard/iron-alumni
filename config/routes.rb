Rails.application.routes.draw do
  root 'front#index'

  scope :admin do
    get '/courses/new',              to: 'admin#new_course',     as: 'new_course_admin'
    post '/courses',                 to: 'admin#create_course',  as: 'create_course_admin'
    get '/courses/:id/members/new',  to: 'admin#new_members',    as: 'new_members_admin'
    post '/courses/:id/members',     to: 'admin#create_members', as: 'create_members_admin'
  end

  devise_for :members, controllers: { registrations: 'registrations', confirmations: 'confirmations' }
  devise_scope :member do
    put '/confirm', to: 'confirmations#confirm', as: 'create_password'
  end
  resources :members, only: [:index, :show]
  resources :courses, only: [:index, :show, :create, :update, :update]
  resources :courses do
    resources :members, controller: 'courses_member', only: [:update]
  end
  resources :members do
    resources :courses, controller: 'member_courses', only: [:update]
  end
end
