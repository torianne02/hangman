Rails.application.routes.draw do
  resources :guessers
  
  post 'signup', to: 'guessers#create'
end
