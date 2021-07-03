Rails.application.routes.draw do
  resources :posts
  get '/list', to: 'posts#list_by_seen'
  root 'posts#index'
 
end
