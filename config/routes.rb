Rails.application.routes.draw do
  post 'signup', to: 'guessers#create'
end
