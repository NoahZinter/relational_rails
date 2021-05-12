Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/manufacturers', to: 'manufacturers#index'
  get '/dealerships', to: 'dealerships#index'
  get '/dealerships/:id', to: 'dealerships#show'
end

