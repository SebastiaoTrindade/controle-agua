Rails.application.routes.draw do
  # Session Login
  root 'sessions#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to:'sessions#destroy'

  # Session Dashboard
  get 'dashboard', to: 'dashboard#index'
  
  resources :medicoes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
