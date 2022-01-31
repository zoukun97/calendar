Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#show'
  resources :conditions, only: [:new, :create, :show, :edit, :update]
end
