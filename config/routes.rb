Rails.application.routes.draw do
  root 'dashboard#index'

  # Session Login
  root 'sessions#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to:'sessions#destroy'
  
  resources :medicaos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
