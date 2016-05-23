Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :contacts, only: [:new, :create]

  root "posts#index"

  get '/about', to: 'pages#about'

  get '*path' => redirect('/')
  
end
