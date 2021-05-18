# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/manufacturers/new', to: 'manufacturers#new'
  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/manufacturers/:id/edit', to: 'manufacturers#edit'
  post '/manufacturers', to: 'manufacturers#create'
  patch '/manufacturers/:id', to: 'manufacturers#update'
  delete '/manufacturers/:id', to: 'manufacturers#destroy'

  get '/manufacturers/:id/vehicles', to: 'manufacturer_vehicles#index'
  get '/manufacturers/:id/vehicles/new', to: 'manufacturer_vehicles#new'
  post '/manufacturers/:id/vehicles', to: 'manufacturer_vehicles#create'

  get '/vehicles', to: 'vehicles#index'
  get '/vehicles/:id', to: 'vehicles#show'
  get '/vehicles/:id/edit', to: 'vehicles#edit'
  patch '/vehicles/:id', to: 'vehicles#update'
  delete '/vehicles/:id', to: 'vehicles#destroy'

  get '/dealerships/:id/edit', to: 'dealerships#edit'
  get '/dealerships/new', to: 'dealerships#new'
  get '/dealerships/:id', to: 'dealerships#show'
  patch '/dealerships/:id', to: 'dealerships#update'
  delete '/dealerships/:id', to: 'dealerships#destroy'
  post '/dealerships', to: 'dealerships#create'
  get '/dealerships', to: 'dealerships#index'

  get '/dealerships/:id/employees/new', to: 'dealerships_employees#new'
  post '/dealerships/:id/employees', to: 'dealerships_employees#create'
  get '/dealerships/:id/employees', to: 'dealerships_employees#index'

  get '/employees/:id/edit', to: 'employees#edit'
  get '/employees/:id', to: 'employees#show'
  patch '/employees/:id', to: 'employees#update'
  delete '/employees/:id', to: 'employees#destroy'
  get '/employees', to: 'employees#index'
  post '/employees', to: 'employees#create'
end
