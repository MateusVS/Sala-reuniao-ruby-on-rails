Rails.application.routes.draw do
  root to: "users#new"
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'loggout', to: 'sessions#destroy'
  
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
end
