Rails.application.routes.draw do

  root 'welcome#home'
  devise_for :employees

  resources :employees
  resources :products
  resources :sales







  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
