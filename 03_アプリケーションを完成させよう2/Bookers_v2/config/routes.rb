Rails.application.routes.draw do
  # get 'users/home'
  # get 'users/index'
  devise_for :users
  resources :books
  root to: 'books#start'
  get '/home/about', to: 'books#about'
  resources :users, :only => [:index, :home, :edit, :update]
  get '/users/:id', to: 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
