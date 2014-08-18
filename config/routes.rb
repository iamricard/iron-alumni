Rails.application.routes.draw do
  devise_for :members
  root 'front#index'
end
