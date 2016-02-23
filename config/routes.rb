Rails.application.routes.draw do


  namespace :api do
    namespace :v1, defaults: {format: :json} do
      get '/merchants/random', to: 'merchants_random#show'
      get '/merchants/find_all', to: 'merchants_find#index'
      get '/merchants/find', to: 'merchants_find#show'
      get '/items/random', to: 'items_random#show'
      get '/items/find_all', to: 'items_find#index'
      get '/items/find', to: 'items_find#show'
      resources :merchants, defaults: {format: :json}
      resources :items, defaults: {format: :json}
    end
  end


end
