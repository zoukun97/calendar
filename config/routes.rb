require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  
  devise_for :users
  root to: 'conditions#index'
  resources :conditions, param: :dates
  resource :profile, only: [:show]
end
