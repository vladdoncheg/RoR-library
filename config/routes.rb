Rails.application.routes.draw do
  resources :books
  resources :readers
  get 'welcome/index'

  root 'welcome#index'
  resources :workers
  resources :libs
end
