Rails.application.routes.draw do
  get 'dashboard/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :medicaos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
