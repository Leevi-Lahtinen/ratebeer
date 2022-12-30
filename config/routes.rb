Rails.application.routes.draw do
  resources :memberships
  resources :beer_clubs
  resources :users
  get '/', to: 'breweries#index'
  #get 'ratings', to: 'ratings#index'
  #get 'ratings/new', to:'ratings#new'
  #post 'ratings', to: 'ratings#create'
  resources :ratings, only: [:index, :new, :create, :destroy]
  resources :beers
  resources :breweries
  get 'signup', to: 'users#new'
  resource :session, only: [:new, :create, :destroy]
  get 'signin', to: 'sessions#new'
  # config/routes.rb
  get '/signout', to: 'sessions#destroy', as: 'signout'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
end
