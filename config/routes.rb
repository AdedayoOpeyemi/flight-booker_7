Rails.application.routes.draw do
  # Defines the root path route ("/")
  root to: "flights#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'flights/index', to: 'flights#index'
  get 'flights/search', to: 'flights#index'
end
