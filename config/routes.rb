Rails.application.routes.draw do

  get 'trips/index'
  get 'trips/new'
  get 'trips/create'
  get 'trips/update'
  get 'trips/destroy'
  get 'trips/show'
  resources :students

  resources :trips do
    resources :buses
  end
end
