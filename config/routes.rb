Rails.application.routes.draw do
  get 'bookings/new'
  post 'bookings/create'
  get '/bookings/:id', to: 'bookings#show', as: 'booking'
  # Defines the root path route ("/")
  root to: "flights#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'flights', to: 'flights#index'
  get 'flights/search', to: 'flights#search'
  # get 'bookings/new', to: 'bookings#new'
end
