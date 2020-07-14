Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/auth/google_oauth2', as: :google_oauth2
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'welcome#show'
  patch '/login', to: 'sessions#new'
  
  get '/registration', to: 'user#new'

  post '/user', to: 'user#create'

  get '/profile', to: 'user#show'

  get '/post', to: 'post#new'
  post '/post', to: 'post#create'
  get '/post/:post_id', to: 'post#show'
end
