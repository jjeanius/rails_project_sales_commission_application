Rails.application.routes.draw do

  get 'employees/auth/:amazon/callback', to: 'employees#index'
  
  root 'welcome#home'
  
  devise_for :employees, :controllers => {:omniauth_callbacks => "callbacks"} # :controllers =>{registrations: 'registrations'}
    #telling devise not to use its namespace for the controller  
  

  resources :employees do
    resources :sales, only: [:index, :new, :show]
  end
  
  resources :products
  resources :sales
  
  delete 'products/:id', to: 'products#destroy'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
