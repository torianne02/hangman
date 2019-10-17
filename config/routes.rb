Rails.application.routes.draw do
  resources :guessers do 
    resources :secret_keepers
  end 
  
  post '/signup', to: 'guessers#create'
end
