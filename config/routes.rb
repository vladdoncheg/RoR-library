Rails.application.routes.draw do
  get 'welcome/index'
  get '/libs/:id/top' => 'libs#top', as: 'top'

  root 'welcome#index'
  
  resources :libs do
    resources :books do
      resources :servs
    end
    resources :readers
    resources :workers
  end
end
