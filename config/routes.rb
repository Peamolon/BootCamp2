Rails.application.routes.draw do
  devise_for :users
  resources :posts
  get '/list', to: 'posts#list_by_seen'
  root 'posts#index'
 
end
