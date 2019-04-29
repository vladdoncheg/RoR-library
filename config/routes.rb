Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'
  resources :workers
  resources :libs
end
