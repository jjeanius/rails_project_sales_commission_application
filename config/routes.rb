Rails.application.routes.draw do
 
  root 'welcome#home'

  devise_for :employees, controllers: {:registrations=> "registrations", :omniauth_callbacks => "callbacks",  }   #telling devise not to use its namespace for the controller
  
  resources :employees do
    resources :sales, only: [:index, :new, :show]
  end
  
  resources :products
  resources :sales
  

  delete 'products/:id', to: 'products#destroy'
  Patch '/sales/:id', to: 'sales'

  get 'employees/auth/:amazon/callback', to: 'employees#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
