Rails.application.routes.draw do

  devise_for :employees, :controllers =>{:omniauth_callbacks => "callbacks"}  
 
  root 'welcome#home'

  
  
  resources :employees do
    resources :sales, only: [:show, :index, :new, :edit, :create]
  end
  
  resources :sales
  resources :products

  
  delete 'products/:id', to: 'products#destroy'
  
  get 'employees/auth/:amazon/callback', to: 'employees#index'

  patch '/sales/:id', to: 'sales#update'

  get 'region', to: 'employees#region'

  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
