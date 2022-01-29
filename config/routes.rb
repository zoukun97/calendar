Rails.application.routes.draw do
  root to: 'homes#show'
  resources :conditions, only: [:new, :create, :show, :edit, :update]
end
