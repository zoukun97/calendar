Rails.application.routes.draw do
  devise_for :users
  root to: 'conditions#index'
  resources :conditions, param: :dates
  resource :profile, only: [:show]
end
