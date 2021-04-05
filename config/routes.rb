Rails.application.routes.draw do
  resources :reservations, only: [:index, :create, :edit, :update, :destroy]
  root to: "users#new"
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'loggout', to: 'sessions#destroy'
  
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]

  resources :reservations do
    get 'load_events', :on => :collection   
  end
end
