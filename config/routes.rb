Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :messages, only: [:new, :create]

  post 'sessions', to: 'sessions#create'
  delete 'sessions', to: 'sessions#destroy'
  
  root to: 'messages#new'
end
