Rails.application.routes.draw do
  resources :clients
  resources :sales, only: [:index, :show, :new, :destroy, :create]
  resources :products
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "application#index"
end
