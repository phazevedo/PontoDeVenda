Rails.application.routes.draw do
  resources :clients
  resources :sales, only: [:index, :show, :new, :destroy, :create]
  resources :products
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_for :admins, path: 'admins'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "application#index"
  get "audits", to: "audits#index", as: "reports"
  get  "user_report",to: "audits#users_report", as: "user_report"
  get  "modules_report",to: "audits#modules_report", as: "module_report"
end
