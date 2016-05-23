Rails.application.routes.draw do
  resources :posts
  resources :contacts, only: [:new, :create]

  root "posts#index"

  get '/about', to: 'pages#about'
  
end
