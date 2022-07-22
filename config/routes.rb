Rails.application.routes.draw do
  
  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/create'
  
   get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # トップページルーティング
  root to: 'tasks#index'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :new, :create]
  # ７つのルーティング
  resources :tasks

end
