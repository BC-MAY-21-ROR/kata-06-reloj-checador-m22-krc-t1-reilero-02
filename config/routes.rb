Rails.application.routes.draw do
  get 'reports/index'
  devise_for :users

  resources :employees
  resources :branches

  get 'admin_panel', to: 'admin_panel#index'
  post 'check' => 'attendances#check'
  get 'reports', to: 'reports#index'

  post 'employees/status/:id', to: 'employees#update_status', as: 'update_status'

  get 'attendances_by_day_pdf', to: 'reports#attendances_by_day_pdf'
  get 'average_checks_by_month_pdf', to: 'reports#average_checks_by_month_pdf'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'dashboard#index'
end
