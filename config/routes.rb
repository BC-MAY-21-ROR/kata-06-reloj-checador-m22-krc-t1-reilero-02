Rails.application.routes.draw do
  resources :employees

  get 'employes/index'
  get 'employes/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
