Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/auth/google_oauth2', as: :google_oauth2
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get '/post', to: 'post#new'
  post '/post', to: 'post#create'
  get '/post/:post_id', to: 'post#show'
end
