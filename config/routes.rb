Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/dealerships', to: 'dealerships#index'
  get '/dealerships/:id', to: 'dealerships#show'
  get '/employees', to: 'employees#index'
  get '/vehicles', to: 'vehicles#index'
  get '/employees/:id', to: 'employees#show'
end
