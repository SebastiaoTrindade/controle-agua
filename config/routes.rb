Rails.application.routes.draw do
  root 'dashboard#index'

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :medicaos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
