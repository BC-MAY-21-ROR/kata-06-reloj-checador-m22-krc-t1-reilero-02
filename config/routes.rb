Rails.application.routes.draw do
  get 'attendances/index'
  get 'attendances/day'
  get 'attendances/absences'

  post "input" => "attendances#input"
  devise_for :users

  resources :employees
  resources :branches
  

  get 'admin_panel', to: 'admin_panel#index'

  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'dashboard#index'
end
