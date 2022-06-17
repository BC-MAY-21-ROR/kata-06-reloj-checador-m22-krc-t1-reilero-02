Rails.application.routes.draw do
  get 'reports/index'
  devise_for :users

  resources :employees
  resources :branches

  get 'admin_panel', to: 'admin_panel#index'
  post 'check' => 'attendances#check'
  get 'reports', to: 'reports#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'dashboard#index'
end
