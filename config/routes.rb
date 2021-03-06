Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      get 'merchants/most_items', to: "merchants_most_items_sold#index"
      get 'merchants/most_revenue', to: "merchants_most_revenue#index"
      get 'merchants/revenue', to: "revenue_by_date#show"
      get 'merchants/:id/favorite_customer', to: "favorite_customer#show"
      get 'merchants/:id/revenue', to: "merchant_revenue#show"
      get 'merchants/:id/items', to:
       "merchant_items#index"
       get 'merchants/:id/invoices', to: "merchant_invoices#index"
      resources :merchants, only: [:index, :show]

      get 'customers/:id/favorite_merchant', to: "favorite_merchant#show"
      get 'customers/:id/invoices', to: "customer_invoices#index"
      get 'customers/:id/transactions', to: "customer_transactions#index"
      resources :customers, only: [:index, :show]

      get 'items/:id/best_day', to: 'item_best_day#show'
      get 'items/most_revenue', to: 'top_revenue_items#index'
      get 'items/most_items', to: 'most_sold#index'
      get 'items/:id/invoice_items', to: "item_invoice_items#index"
      get 'items/:id/merchant', to: "item_merchant#show"
      resources :items, only: [:index, :show]

      get 'invoices/:id/transactions', to: "invoice_transactions#index"
      get 'invoices/:id/invoice_items', to: "invoice_invoice_items#index"
      get 'invoices/:id/items', to: "items_by_invoice#index"
      get 'invoices/:id/customer', to: "invoice_customer#show"
      get 'invoices/:id/merchant', to: "invoice_merchant#show"
      resources :invoices, only: [:index, :show]

      get 'transactions/:id/invoice', to: "transaction_invoice#show"
      resources :transactions, only: [:index, :show]

      get 'invoice_items/:id/invoice', to: "invoice_item_invoice#show"
      get 'invoice_items/:id/item', to: "invoice_item_item#show"
      resources :invoice_items, only: [:index, :show]
    end
  end
  
end
