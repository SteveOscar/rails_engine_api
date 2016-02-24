Rails.application.routes.draw do


  namespace :api do
    namespace :v1, defaults: {format: :json} do
      get '/merchants/random', to: 'merchants/merchants_random#show'
      get '/merchants/find_all', to: 'merchants/merchants_find#index'
      get '/merchants/find', to: 'merchants/merchants_find#show'
      get '/merchants/most_revenue', to: 'merchants/merchants_revenue#index'
      get '/merchants/:id/revenue', to: 'merchants/merchants_revenue#show'
      get '/merchants/:merchant_id/items', to: 'merchants/items#index'
      get '/merchants/:merchant_id/invoices', to: 'merchants/invoices#index'

      get '/items/random', to: 'items/items_random#show'
      get '/items/find_all', to: 'items/items_find#index'
      get '/items/find', to: 'items/items_find#show'
      get '/items/:id/invoice_items', to: 'items/invoice_items#index'
      get '/items/:id/merchant', to: 'items/merchant#show'

      get '/customers/random', to: 'customers/customers_random#show'
      get '/customers/find_all', to: 'customers/customers_find#index'
      get '/customers/find', to: 'customers/customers_find#show'
      get '/customers/:id/invoices', to: 'customers/invoices#show'
      get '/customers/:id/transactions', to: 'customers/transactions#index'

      get '/transactions/random', to: 'transactions/transactions_random#show'
      get '/transactions/find_all', to: 'transactions/transactions_find#index'
      get '/transactions/find', to: 'transactions/transactions_find#show'
      get '/transactions/:id/invoice', to: 'transactions/invoice#show'

      get '/invoices/random', to: 'invoices/invoices_random#show'
      get '/invoices/find_all', to: 'invoices/invoices_find#index'
      get '/invoices/find', to: 'invoices/invoices_find#show'
      get '/invoices/:id/transactions', to: 'invoices/transactions#index'
      get '/invoices/:id/invoice_items', to: 'invoices/invoice_items#index'
      get '/invoices/:id/items', to: 'invoices/items#index'
      get '/invoices/:id/customer', to: 'invoices/customer#show'
      get '/invoices/:id/merchant', to: 'invoices/merchant#show'

      get '/invoice_items/random', to: 'invoice_items/invoice_items_random#show'
      get '/invoice_items/find_all', to: 'invoice_items/invoice_items_find#index'
      get '/invoice_items/find', to: 'invoice_items/invoice_items_find#show'
      get '/invoice_items/:id/invoice', to: 'invoice_items/invoice#show'
      get '/invoice_items/:id/item', to: 'invoice_items/item#show'

      resources :invoice_items, module: 'invoice_items'
      resources :invoices, module: 'invoices'
      resources :transactions, module: 'transactions'
      resources :merchants, module: 'merchants' do
        # resources :items
        resources :invoices
      end
      resources :items, module: 'items'
      resources :customers, module: 'customers'
    end
  end


end
