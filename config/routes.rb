ToDoTemplate::Application.routes.draw do
  root to: 'sessions#new'
  
  get '/register', to: 'users#new'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  resources :tasks   
  resources :statuses, only: [:new, :create, :show]
  resources :users, only: [:show, :create, :edit, :update ]
end
