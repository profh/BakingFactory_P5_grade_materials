Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'api/customers' => 'customers#index', :defaults => { :format => 'json' }, as: 'api_customers'
  get 'api/customer/:id' => 'customers#show', :defaults => { :format => 'json' }, as: 'api_customer'

  get 'api/orders' => 'orders#index', :defaults => { :format => 'json' }, as: 'api_orders'
  get 'api/order/:id' => 'orders#show', :defaults => { :format => 'json' }, as: 'api_order'
end
