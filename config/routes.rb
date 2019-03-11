Rails.application.routes.draw do
  namespace :api do

  get  '/users' => 'users#index'
  post '/users' => 'users#create'
  get  '/users' => 'users#show'
  patch '/users' => 'users#update'
  delete '/users' => 'users#destroy'  

  get  '/sessions' => 'sessions#index'
  post '/sessions' => 'sessions#create'
  get  '/sessions' => 'sessions#show'

  get '/restaurants' => 'restaurants#index'
  post '/restaurants' => 'restaurants#create'
  get '/restaurants' => 'restaurants#show'
  patch '/restaurants' => 'restaurants#update'
  delete '/restaurants' => 'restaurants#destroy'

  get 'reviews' => 'reviews#index'
  post '/reviews' => 'reviews#create'
  get '/reviews' => 'reviews#show'
  patch '/reviews' => 'reviews#update'
  delete '/reviews' => 'reviews#destroy'

  get 'pictures' => 'pictures#index'
  post '/pictures' => 'pictures#create'
  get '/pictures' => 'pictures#show'
  patch 'pictures' => 'pictures#update'
  delete 'pictures' => 'pictures#destroy'
  end
end
