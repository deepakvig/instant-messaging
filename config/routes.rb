Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :messages, only: [:index, :create]

  post 'sessions', to: 'sessions#create'
  delete 'sessions', to: 'sessions#destroy'

  namespace :api do 
    namespace :v1 do 
      resources :convert_message
    end 
  end
  
  root to: 'messages#index'
end
