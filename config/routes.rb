Rails.application.routes.draw do
  get 'messages/create'
  root 'rooms#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  resources :rooms do
    resources :messages
  end
  resources :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
