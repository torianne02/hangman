Rails.application.routes.draw do
  root 'static_pages#home'
  post '/signup', to: 'guessers#create'
  get '/signin', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  resources :guessers do 
    resources :secret_keepers
  end 
end
