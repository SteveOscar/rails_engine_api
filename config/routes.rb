Rails.application.routes.draw do


  namespace :api do
    namespace :v1, defaults: {format: :json} do
      get '/merchants/random', to: 'merchants_random#show'
      get '/merchants/find_all', to: 'merchants_find#index'
      get '/merchants/find', to: 'merchants_find#show'
      get '/items/random', to: 'items_random#show'
      get '/items/find_all', to: 'items_find#index'
      get '/items/find', to: 'items_find#show'
      get '/customers/random', to: 'customers_random#show'
      get '/customers/find_all', to: 'customers_find#index'
      get '/customers/find', to: 'customers_find#show'
      get '/transactions/random', to: 'transactions_random#show'
      get '/transactions/find_all', to: 'transactions_find#index'
      get '/transactions/find', to: 'transactions_find#show'
      get '/invoices/random', to: 'invoices_random#show'
      get '/invoices/find_all', to: 'invoices_find#index'
      get '/invoices/find', to: 'invoices_find#show'
      get '/invoice_items/random', to: 'invoice_items_random#show'
      get '/invoice_items/find_all', to: 'invoice_items_find#index'
      get '/invoice_items/find', to: 'invoice_items_find#show'
      resources :invoice_items, defaults: {format: :json}
      resources :invoices, defaults: {format: :json}
      resources :transactions, defaults: {format: :json}
      resources :merchants, defaults: {format: :json}
      resources :items, defaults: {format: :json}
      resources :customers, defaulst: {format: :json}
    end
  end


end
