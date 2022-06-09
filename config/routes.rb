Rails.application.routes.draw do
  root 'pages#home'
  resources :groups
  resources :groups do
    get 'create_event', to: 'groups#create_event'
  end
  resources :users
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :members, only: [:new, :create, :show, :destroy]  
end
