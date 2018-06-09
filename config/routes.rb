Rails.application.routes.draw do
  resources :stocks
  resources :acquisition_products
  resources :sale_products
  resources :acquisitions
  resources :sales
  resources :products
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "application#index"
end
