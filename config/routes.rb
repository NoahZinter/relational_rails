Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/manufacturers/:id/vehicles', to: 'manufacturers_vehicles#index'

  get '/vehicles', to: 'vehicles#index'
  get '/vehicles/:id', to: 'vehicles#show'

  get '/dealerships', to: 'dealerships#index'
  get '/dealerships/:id', to: 'dealerships#show'

  get '/employees', to: 'employees#index'
  get '/employees/:id', to: 'employees#show'
  get '/dealerships/:id/employees', to: 'dealerships_employees#index'
end
