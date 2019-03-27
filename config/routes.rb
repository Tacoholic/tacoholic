Rails.application.routes.draw do
  namespace :api do
    get  '/users' => 'users#index'
    post '/users' => 'users#create'
    get  '/users/:id' => 'users#show'
    patch '/users/:id' => 'users#update'
    delete '/users/:id' => 'users#destroy'  

    get  '/sessions' => 'sessions#index'
    post '/sessions' => 'sessions#create'
    get  '/sessions' => 'sessions#show'

    get '/restaurants' => 'restaurants#index'
    post '/restaurants' => 'restaurants#create'
    get '/restaurants/:id' => 'restaurants#show'
    patch '/restaurants/:id' => 'restaurants#update'
    delete '/restaurants/:id' => 'restaurants#destroy'

    get 'reviews' => 'reviews#index'
    post '/reviews' => 'reviews#create'
    get '/reviews/:id' => 'reviews#show'
    patch '/reviews/:id' => 'reviews#update'
    delete '/reviews/:id' => 'reviews#destroy'

    get 'pictures' => 'pictures#index'
    post '/pictures' => 'pictures#create'
    get '/pictures/:id' => 'pictures#show'
    patch 'pictures/:id' => 'pictures#update'
    delete 'pictures/:id' => 'pictures#destroy'
  end

  namespace :google do
    get '/restaurants' => 'restaurants#index'
    get '/restaurants/:place_id' => 'restaurants#show'
  end
end
