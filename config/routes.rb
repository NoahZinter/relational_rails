Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/manufacturers/new', to: 'manufacturers#new'
  post '/manufacturers', to: 'manufacturers#create'
  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/manufacturers/:id/vehicles', to: 'manufacturer_vehicles#index'

  get '/vehicles', to: 'vehicles#index'
  get '/vehicles/:id', to: 'vehicles#show'

  get '/dealerships', to: 'dealerships#index'
  get '/dealerships/new', to: 'dealerships#new'
  get '/dealerships/:id', to: 'dealerships#show'
  get '/dealerships/:id/employees', to: 'dealerships_employees#index'
  post '/dealerships/:id/employees', to: 'dealerships_employees#create'
  get '/dealerships/:id/employees/new', to: 'dealerships_employees#new'
  get '/dealerships/:id/edit', to: 'dealerships#edit'
  post '/dealerships', to: 'dealerships#create'
  patch '/dealerships/:id', to: 'dealerships#update'

  get '/employees', to: 'employees#index'
  get '/employees/:id', to: 'employees#show'
  get '/employees/:id/edit', to: 'employees#edit'
  post '/employees', to: 'employees#create'
  patch '/employees/:id', to: 'employees#update'
end
