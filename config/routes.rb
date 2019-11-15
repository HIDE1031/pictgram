Rails.application.routes.draw do
  get 'comments/create'

  get 'comments/destroy'

  get 'sessions/new'

  root 'pages#index'
  get  'pages/help'
  
  get     'login',  to: 'sessions#new'
  post    'login',  to: 'sessions#create'
  delete  'logout', to: 'sessions#destroy'
  
  resources :users
  resources :topics
  
  get '/favorites', to: 'favorites#index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
  get  '/comments', to: 'comments#new'
  post '/comments', to: 'comments#create'
end
