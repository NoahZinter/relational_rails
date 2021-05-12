Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/manufacturers', to: 'manufacturers#index'
  get '/dealerships', to: 'dealerships#index'
  get '/dealerships/:id', to: 'dealerships#show'
  get '/employees', to: 'employees#index'
  get '/vehicles', to: 'vehicles#index'
  get '/employees/:id', to: 'employees#show'
  get '/dealerships/:id/employees', to: 'dealerships_employees#index'
end
