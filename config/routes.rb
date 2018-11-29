Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      get 'merchants/revenue', to: "revenue_by_date#show"
      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]
      get 'customers/:id/favorite_merchant', to: "favorite_merchant#show"

      # get 'items/:id/best_day', to: 'best_day#show'
      get 'items/most_items', to: 'most_sold#index' 
      resources :items, only: [:index, :show]

      resources :invoices, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
  
end
