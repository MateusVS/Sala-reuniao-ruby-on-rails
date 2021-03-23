Rails.application.routes.draw do
  root to: "users#new"
  resources :users, only: [:new, :create, :edit, :show, :update, :destroy]
end
