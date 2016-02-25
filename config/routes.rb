Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :items, module: 'items' do
        collection do
          get '/random', to: 'items_random#show'
          get '/find_all', to: 'items_find#index'
          get '/find', to: 'items_find#show'
          get '/:id/invoice_items', to: 'invoice_items#index'
          get '/:id/merchant', to: 'merchant#show'
          get '/most_revenue', to: 'items_revenue#index'
          get '/most_items', to: 'most_items#index'
          get '/:id/best_day', to: 'best_day#show'
        end
      end

      resources :customers, module: 'customers' do
        collection do
          get '/random', to: 'customers_random#show'
          get '/find_all', to: 'customers_find#index'
          get '/find', to: 'customers_find#show'
          get '/:id/invoices', to: 'invoices#show'
          get '/:id/transactions', to: 'transactions#index'
          get '/:id/favorite_merchant', to: 'favorite_merchant#show'
        end
      end

      resources :transactions, module: 'transactions' do
        collection do
          get '/random', to: 'transactions_random#show'
          get '/find_all', to: 'transactions_find#index'
          get '/find', to: 'transactions_find#show'
          get '/:id/invoice', to: 'invoice#show'
        end
      end

      resources :invoices, module: 'invoices' do
        collection do
          get '/random', to: 'invoices_random#show'
          get '/find_all', to: 'invoices_find#index'
          get '/find', to: 'invoices_find#show'
          get '/:id/transactions', to: 'transactions#index'
          get '/:id/invoice_items', to: 'invoice_items#index'
          get '/:id/items', to: 'items#index'
          get '/:id/customer', to: 'customer#show'
          get '/:id/merchant', to: 'merchant#show'
        end
      end

      resources :invoice_items, module: 'invoice_items' do
        collection do
          get '/random', to: 'invoice_items_random#show'
          get '/find_all', to: 'invoice_items_find#index'
          get '/find', to: 'invoice_items_find#show'
          get '/:id/invoice', to: 'invoice#show'
          get '/:id/item', to: 'item#show'
        end
      end

      resources :merchants, module: 'merchants' do
        resources :invoices
        collection do
          get '/random', to: 'merchants_random#show'
          get '/find_all', to: 'merchants_find#index'
          get '/find', to: 'merchants_find#show'
          get '/most_revenue', to: 'merchants_revenue#index'
          get '/most_items', to: 'most_items#index'
          get '/:id/revenue', to: 'merchants_revenue#show'
          get '/:id/favorite_customer', to: 'merchants_customer#show'
          get '/:id/customers_with_pending_invoices', to: 'pending_invoices#index'
          get '/:merchant_id/items', to: 'items#index'
          get '/:merchant_id/invoices', to: 'invoices#index'
          get '/revenue', to: 'revenue#index'
        end
      end
    end
  end
end
