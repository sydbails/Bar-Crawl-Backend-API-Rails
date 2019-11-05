Rails.application.routes.draw do
  resources :crawlers
  resources :crawls
  resources :users

  post '/login', to: 'sessions#create'
end
