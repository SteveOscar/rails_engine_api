Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      get '/merchants/random', to: 'merchants_random#show', defaults: {format: :json}
      get '/merchants/find_all', to: 'merchants_find#index', defaults: {format: :json}
      get '/merchants/find', to: 'merchants_find#show', defaults: {format: :json}
      resources :merchants, defaults: {format: :json}
    end
  end


end
