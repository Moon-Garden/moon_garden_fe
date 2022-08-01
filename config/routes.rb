Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'dashboard#show'
  post '/gardens', to: 'gardens#create'
  get '/gardens/new', to: 'gardens#new'
  get '/gardens/:id', to: 'gardens#show'
  get '/gardens/:id/plants', to: 'plants#search'

  post '/gardens/:id/plants/new', to: 'plants#create'
end
