Rails.application.routes.draw do
  resources :users 
  resources :reviews
  
  resources :routes do 
    resources :reviews
  end



  get '/', to: 'sessions#welcome', as: "welcome"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
